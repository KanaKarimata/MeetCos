module Public::NotificationsHelper
  def notification_form(notification)
    @sender = notification.sender
    @post_comment = nil
    @sender_comment = notification.post_comment_id
    case notification.action
    when 'follow'
      tag.a(notification.sender.name, href: user_path(@sender)) + 'があなたをフォローしました'
    when 'like'
      tag.a(notification.sender.name, href: user_path(@sender)) + 'が' + tag.a('あなたの投稿', href: micropost_path(notification.micropost_id)) + 'にいいねしました'
    when 'comment' then
      @post_comment = PostComment.find_by(id: @sender_comment)
      @comment_content =@post_comment.comment
      # @micropost_title =@comment.product.title
      tag.a(@sender.name, href: user_path(@sender)) + 'があなたの投稿にコメントしました'
    end
  end
end
