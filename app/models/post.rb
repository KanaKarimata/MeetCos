class Post < ApplicationRecord

  # 画像複数枚投稿
  has_many_attached :post_images
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favs, dependent: :destroy
  has_many :notifications
  has_many :hashtag_posts, dependent: :destroy
  has_many :hashtags, through: :hashtag_posts

  validates :post_images, presence: true
  validates :caption, presence: true
  # validates :post_image_type, :post_image_length

  # いいね機能に利用する
  def favorited_by?(user)
    favs.exists?(user_id: user.id)
  end

  # 通知機能
  def create_notification_fav!(current_user)
    # すでにいいねされているか検索
    temp = Notification.where(["sender_id = ? and receiver_id = ? and post_id = ? and action = ?", current_user.id, user_id, id, 'fav'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.send_notifications.new(
        post_id: id,
        receiver_id: id,
        action: 'fav'
        )
      # 自分が自分の投稿にいいねする場合は、通知済みとする
      if notification.sender_id == notification.receiver_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  # 検索機能
  def self.search_for(content)
    Post.where('caption LIKE ?', '%' + content + '%')
  end

  # タグ機能
  def save_hashtags(savepost_hashtags)
    # 現在のユーザーが持っているタグ
    current_hashtags = self.hashtags.pluck(:hashname) unless self.hashtags.nil?
    # 今のpostが持っているタグ、今回保存されるタグではないタグを古いタグとする
    old_hashtags = current_hashtags - savepost_hashtags
    # 新しいタグ
    new_hashtags = savepost_hashtags - current_hashtags

    # 古いタグを消す
    old_hashtags.each do |old_name|
      self.hashtags.delete Hashtag.find_by(hashname:old_name)
    end

    # 新しいタグを作成
    new_hashtags.each do |new_name|
      # post_hashtag = Hashtag.find_by(name:new_name)
      self.hashtags << Hashtag.find_by(hashname:new_name)
    end
  end

  private

  def post_image_type
    post_images.each do |image|
      if !image.blob.content_type.in?(%('image/jpeg image/jpg image/png'))
        image.purge
        errors.add(:post_images, 'はjpeg, jpgまたはpng形式でアップロードしてください')
      end
    end
  end

  def post_image_length
    if post_images.length > 10
      post_image.purge
      post_image.add(:avatars, "は10枚以内にしてください")
    end
  end

end
