class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: { maximum: 50 }
  has_many :hashtag_posts, dependent: :destroy, foreign_key: 'hashtag_id'
  has_many :posts, through: :hashtag_posts

  def self.create_if_nothing(hashname)
    # ["", "aaaa", "bbbb"]
    hashtag_names = hashname.split(" ").uniq
    hashtag_names.delete("")
    # [ハッシュタグの名前の文字列1, ハッシュタグの名前の文字列2]
    hashtag_names.map do |hashtag|
      Hashtag.find_or_create_by(hashname: hashtag.downcase)
      hashtag.downcase
    end
  end

  # ハッシュタグ検索
  def self.search_posts_for(content)
    hashtags = Hashtag.where('hashname LIKE ?', '%' + content + '%')
    return hashtags.inject(init = []) {|result, hashtags| result + hashtags.posts}
  end

end
