module Public::NotificationsHelper
  def notification_form(notification)
    pp notification
    @sender = notification.sender
    @post_comment = nil
    case notification.action
    when 'follow' then
      tag.a(notification.sender.name, href: user_path(@sender)) + 'があなたをフォローしました'
    when 'like' then
      tag.a(notification.sender.name, href: user_path(@sender)) + 'が' + tag.a('あなたの投稿', href: micropost_path(notification.micropost_id)) + 'にいいねしました'
    when 'comment' then
      @post_comment = PostComment.find_by(id: notification.action_id)
      @comment_content =@post_comment.comment
      # @micropost_title =@comment.product.title
      tag.a(@sender.name, href: user_path(@sender)) + 'があなたの投稿にコメントしました'
    when 'Message' then
      @message = Message.find_by(id: notification.action_id)
      tag.a(@sender.name, href: room_path(@message.room_id)) + 'があなたにメッセージを送信しました'
    end
  end
end
