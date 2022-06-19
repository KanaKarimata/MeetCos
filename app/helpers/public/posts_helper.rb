module Public::PostsHelper
  def render_with_hashtags(hashbody)
    # hashbody.each do |word|{  link_to word.hashname, "/post/hashtag/#{word.hashname.delete("#")}",data: {"turbolinks" => false} }#.html_safe
  end
end
