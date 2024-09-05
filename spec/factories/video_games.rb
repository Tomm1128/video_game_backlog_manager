require 'faker'

FactoryBot.define do
  factory :video_game do
    name { Faker::Game.title }
    description { Faker::Lorem.sentence(word_count: 10) }
    release_date { Faker::Date.between(from: "2000-01-01", to: "2024-01-01") }
    developer { Faker::Company.name }
    publisher { Faker::Company.name }
    platform { Faker::Game.platform }
  end
end
