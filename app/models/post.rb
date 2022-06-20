class Post < ApplicationRecord

  # 画像複数枚投稿
  has_many_attached :post_images
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favs, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :hashtag_posts, dependent: :destroy
  has_many :hashtags, through: :hashtag_posts

  validates :post_images, presence: true
  validates :caption, presence: true

  # def get_post_images(width, height)
  #   post_images.variant(resize_to_limit: [width, height]).processed
  # end

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

end
