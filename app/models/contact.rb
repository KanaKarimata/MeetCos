class Contact < ApplicationRecord
  belongs_to :user
  validates :title, length: { minimum: 3 }
  validates :body, length: { minimum: 5, maximum: 400 }
end
