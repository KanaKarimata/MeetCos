module Public::NotificationsHelper
  def notification_form(notification)
    pp notification
    @sender = notification.sender
    # @post_comment = nil
    case notification.action
    when 'Follow' then
      # @follow = reverse_of_relationships.find_by(id: notification.action_id)
      tag.a(@sender.name, href: user_path(@sender)) + 'があなたをフォローしました'
    when 'Fav' then
      # @fav = Post.find_by(id: notification.action_id)
      tag.a(notification.sender.name, href: user_path(@sender)) + 'があなたの投稿にいいねしました'
    when 'PostComment' then
      @post_comment = PostComment.find_by(id: notification.action_id)
      tag.a(@sender.name, href: user_path(@sender)) + 'があなたの投稿にコメントしました'
    when 'Message' then
      @message = Message.find_by(id: notification.action_id)
      tag.a(@sender.name, href: room_path(@message.room_id)) + 'があなたにメッセージを送信しました'
    end
  end
end
