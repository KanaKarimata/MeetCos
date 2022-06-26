class Room < ApplicationRecord
  belongs_to :hosts, class_name: "User"
  belongs_to :guests, class_name: "User"
  has_many :messages, dependent: :destroy
end
