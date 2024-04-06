class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username

  has_many :cats, inverse_of: :user, dependent: :destroy
  has_many :comments, inverse_of: :user, dependent: :destroy
  has_many :loves, dependent: :destroy

  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false},
    format: {with: URI::MailTo::EMAIL_REGEXP}

  validates :username,
    presence: true,
    length: {minimum: 3},
    uniqueness: {case_sensitive: false}

  validates :social_media_url,
    uniqueness: {case_sensitive: false},
    format: {with: URI::DEFAULT_PARSER.make_regexp, message: "Invalid URL format"},
    allow_nil: true,
    allow_blank: true

  passwordless_with :email
end
