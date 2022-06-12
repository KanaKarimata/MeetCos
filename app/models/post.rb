class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :main_category
  belongs_to_active_hash :sub_category

  has_one_attached :post_image
  belongs_to :user

  validates :image, presence: true
  validates :caption, presence: true
  validates :post_category, presence: true
  validates :color_type, presence: true
  validates :makeup_image, presence: true
  validates :main_category_id, presence: true
  validates :sub_category_id, presence: true

  enum post_category: {
    makeup: 0,
    cosmetics: 1
    }, _suffix: true

  enum color_type: {
    blue: 0,
    yellow: 1
  }, _suffix: true

  enum makeup_image: {
    natural: 0,
    korean: 1,
    girly: 2,
    adult: 3,
    gal: 4,
    oversea: 5,
    office: 6,
    bridal: 7
  }, _suffix: true

  def get_post_image(width, height)
    post_image.variant(resize_to_limit: [width, height]).processed
  end

end
