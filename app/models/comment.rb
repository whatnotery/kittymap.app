class Comment < ApplicationRecord
  belongs_to :cat, inverse_of: :comments
  belongs_to :user, inverse_of: :comments

  validates :body,
    presence: true
end
