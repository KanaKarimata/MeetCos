class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications
  
  validates :comment, presence: true

  # 通知機能
  # def create_notification_comment!(current_user, comment_id)
  #   # 自分以外にコメントしている人を全て取得し全員に通知を送る
  #   temp_ids = PostComment.select(:user_id).where(post_id: id), where.not(user_id: current_user.id).distinct
  #   temp_ids.each do |temp_id|
  #     save_notification_comment!(current_user, post_comment_id, user_id, temp_id['user_id'])
  #   end
  #   # まだ誰も投稿していない場合は投稿者に通知を送る
  #   save_notification_comment!(current_user, post_comment_id, user_id) if temp_ids.blank?
  # end

  # def save_notification_comment!(current_user, post_comment_id, receiver_id)
  #   # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
  #   notification = current_user.send_notifications.new(
  #     post_id: id,
  #     post_comment_id: post_comment_id,
  #     receiver_id: receiver_id,
  #     action: 'comment'
  #     )
  #     # 自分が自分の投稿にコメントするときは通知済みとする
  #     if notification.sender_id == notification.receiver_id
  #       notification.checked = true
  #     end
  #     notification.save if notification.valid?
  # end
end
