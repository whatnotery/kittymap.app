class Comment < ApplicationRecord
  belongs_to :cat
  belongs_to :user

  validates :body,
  presence: true

end
