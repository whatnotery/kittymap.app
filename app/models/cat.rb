class Cat < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :comments, dependent: :destroy


  validates :alias,
  presence: true,
  length: { minimum: 3},
  uniqueness: { case_sensitive: false }

  validates :description,
  presence: true,
  length: { minimum: 10 }

  validates :latitude,
  presence: true

  validates :latitude,
  presence: true
end


