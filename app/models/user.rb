class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_one_attached :cover_image
  # 投稿のアソシエーション
  has_many :posts, dependent: :destroy
  # 投稿へのコメントのアソシエーション
  has_many :post_comments, dependent: :destroy
  # 投稿へのいいねのアソシエーション
  has_many :favs, dependent: :destroy

  # フォローされる
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # フォローする
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed

  # DM機能のアソシエーション
  has_many :rooms, through: :room_users, dependent: :destroy
  has_many :messages, dependent: :destroy

  # 通知機能のアソシエーション
  # 自分が送った通知
  has_many :send_notifications, class_name: "Notification", foreign_key: "sender_id", dependent: :destroy
  # 受け取る通知
  has_many :receive_notifications, class_name: "Notification", foreign_key: "receiver_id", dependent: :destroy
  has_many :notifications, through: :send_notifications, source: :receiver
  has_many :notifications, through: :receive_notifications, source: :sender


  # 会員管理のための記述
  enum is_deleted: {"会員": false,"退会": true }

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no-image-user.png')
      profile_image.attach(io: File.open(file_path), filename: 'no-image-user.png', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def get_cover_image(width, height)
    unless cover_image.attached?
      file_path = Rails.root.join('app/assets/images/no_cover_image.png')
      cover_image.attach(io: File.open(file_path), filename: 'no_cover_image.png', content_type: 'image/jpeg')
    end
    cover_image.variant(resize_to_limit: [width, height]).processed
  end

  # フォローフォロワー関係のアクション
  def follow(user)
    relationships.find_or_create_by(followed_id: user.id)
  end

  def unfollow(user)
    follow = relationships.find_by(followed_id: user.id)
    follow.destroy if follow
  end

  def following?(user)
    followings.include?(user)
  end

  # ゲストログイン機能
  def self.guest
    find_or_create_by!(name: 'ゲスト',
                       userid: 'ゲスト',
                       email: 'geust@example.com',
                        ) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end

  # フォロー通知機能
  def create_notification_follow!(current_user)
    temp = Notification.where(["sender_id = ? and receiver_id = ? and action = ?", current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.send_notifications.new(
        receiver_id: id,
        action: 'follow'
        )
        notification.save if notification.valid?
    end
  end

  # 検索機能
  def self.search_for(content, method)
    # if method == 'perfect'
    #   User.where(name: content)
    # elsif method == 'forward'
    #   User.where('name LIKE ?', content + '%')
    # elsif method == 'backward'
    #   User.where('name LIKE ?', '%' + content)
    # else
      User.where('name LIKE ?', '%' + content + '%')
    # end
  end

end
