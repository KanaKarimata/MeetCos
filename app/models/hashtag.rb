class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: { maximum: 50 }
  has_many :hashtag_posts, dependent: :destroy
  has_many :posts, through: :hashtag_posts
  
  def self.create_if_nothing(hashbody)
    # ["", "aaaa", "bbbb"]
    hashtag_names = hashbody.split("#").uniq
    hashtag_names.delete("")
    # [ハッシュタグのインスタンス1, ハッシュタグのインスタンス2]
    hashtag_names.map do |hashtag|
      Hashtag.find_or_create_by(hashname: hashtag.downcase)
    end
  end
  
  def aaaaa
    nums = [1, 2]
    
    #["1", "2"]
    str_nums = nums.map do |num|
      num.to_s
    end
  end
end
