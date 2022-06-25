class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @search_type = params[:search_type]
    @content = params[:content]
    if @search_type == 'user'
      @records = User.search_for(@content)
    elsif @search_type == 'post'
      @records = Post.search_for(@content)
      @comment_new = PostComment.new
    elsif @search_type == 'hashtag'
      @records = Hashtag.search_posts_for(@content)
      @comment_new = PostComment.new
    end
  end
end
