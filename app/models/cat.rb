class Cat < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :comments, dependent: :destroy, inverse_of: :cat
  has_many :loves, dependent: :destroy, inverse_of: :cat, counter_cache: true


  validates :alias,
  presence: true,
  length: { minimum: 3},
  uniqueness: { case_sensitive: false }

  validates :description,
  presence: true,
  length: { minimum: 6 }

  validates :latitude,
  presence: true

  validates :latitude,
  presence: true
end


