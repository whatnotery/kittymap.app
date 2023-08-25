FactoryBot.define do
  factory :cat do
    name { Faker::Creature::Cat.name }
    description { "whooooo's a realllllllyyyy Goooood Kittty" }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    user { association :user }
    photo { Rack::Test::UploadedFile.new("spec/support/cat.jpg") }
  end
end
