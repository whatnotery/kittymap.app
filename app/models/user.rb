class User < ApplicationRecord
    has_many :cats
    has_many :comments
    
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
