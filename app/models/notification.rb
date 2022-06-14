class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) } #新着順で表示する
  belongs_to :sender, class_name: "User", foreign_key: "sender_id", optional: true
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id", optional: true
  belongs_to :post, optional: true
  belongs_to :post_comment, optional: true
  belongs_to :message, optional: true
end
