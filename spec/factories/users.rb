FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    social_media_url { Faker::Internet.url }

    factory :admin_user do
      is_admin { true }
    end
  end
end
