class Cat < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :comments
end

