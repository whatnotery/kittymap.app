class Cat < ApplicationRecord
  extend FriendlyId
  friendly_id :name

  belongs_to :user
  has_one_attached :photo
  has_many :comments, dependent: :destroy, inverse_of: :cat
  has_many :loves, dependent: :destroy, inverse_of: :cat, counter_cache: true

  validates :name,
    presence: true,
    length: {minimum: 3},
    uniqueness: {case_sensitive: false}

  validates :description,
    presence: true,
    length: {minimum: 6}

  validates :latitude,
    presence: true

  validates :latitude,
    presence: true

  scope :ordered_by_love, -> {
    left_joins(:loves)
      .select("cats.*, COUNT(loves.id) AS love_count")
      .group("cats.id")
      .order("love_count DESC")
  }
end
