FactoryBot.define do
  factory :collection_video_game do
    association :collection, factory: :collection
    association :video_game, factory: :video_game
    playtime { "#{rand(1..100)} hours" }
  end
end
