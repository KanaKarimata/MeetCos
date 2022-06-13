class Post < ApplicationRecord

  has_one_attached :post_image
  belongs_to :user
  has_many :post_comments, dependent: :destroy

  validates :post_image, presence: true
  validates :caption, presence: true

  def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no-image-user.png')
      post_image.attach(io: File.open(file_path), filename: 'no-image-user.png', content_type: 'image/jpeg')
    end
    post_image.variant(resize_to_limit: [width, height]).processed
  end

end
