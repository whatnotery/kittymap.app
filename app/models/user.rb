class User < ApplicationRecord
    has_many :cats, inverse_of: :user
    has_many :comments, inverse_of: :user
    
    validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: URI::MailTo::EMAIL_REGEXP }

    validates :username,
    presence: true,
    length: { minimum: 3 },
    uniqueness: { case_sensitive: false }

    passwordless_with :email
end
