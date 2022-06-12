class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  
  has_many :posts, dependent: :destroy
  

  # 会員管理のための記述
  enum is_deleted: {"会員": false,"退会": true }

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no-image-user.png')
      profile_image.attach(io: File.open(file_path), filename: 'no-image-user.png', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
