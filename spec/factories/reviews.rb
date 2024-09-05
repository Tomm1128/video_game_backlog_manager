require 'faker'

FactoryBot.define do
  factory :review do
    title { Faker::Lorem.sentence(word_count: 3) }
    body { Faker::Lorem.paragraph(sentence_count: 3) }
    rating { rand(1..5) }
    association :user
    association :video_game
  end
end
