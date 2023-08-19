class Love < ApplicationRecord
  belongs_to :cat , counter_cache: true
  belongs_to :user
end
