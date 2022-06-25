class Public::PostCommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = post.id
    @post = @comment.post
    if @comment.save
      Notification.create!(receiver_id: @post.user_id, sender_id: current_user.id, action: "PostComment", action_id: @comment.id)
    end
  end

  def destroy
    @comment = PostComment.find_by(id: params[:id], post_id: params[:post_id])
    @comment.destroy
    # redirect_to post_path(@comment.post)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
