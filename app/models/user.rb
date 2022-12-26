class User < ApplicationRecord
    has_many :cats
    has_many :comments

    passwordless_with :email
end
