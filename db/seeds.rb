# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

users = Array.new(10) do
  User.create!(
    username: Faker::Internet.username,
    password: "password#{rand(1..10)}",
    bio: Faker::Quote.famous_last_words
  )
end

genres = Genre.create!([
                         { name: "RPG" },
                         { name: "Strategy" },
                         { name: "Platformer" },
                         { name: "Puzzle" },
                         { name: "Action" },
                         { name: "Adventure" },
                         { name: "Shooter" },
                       ])

video_games = Array.new(20) do
  VideoGame.create!(
    name: Faker::Game.title,
    description: Faker::Lorem.sentence(word_count: 15),
    release_date: Faker::Date.between(from: "2000-01-01", to: "2024-01-01"),
    developer: Faker::Company.name,
    publisher: Faker::Company.name,
    platform: Faker::Game.platform
  )
end

video_games.each do |video_game|
  VideoGameGenre.create!(
    video_game: video_game,
    genre: genres.sample
  )
end

users.each do |user|
  %w[In-Progress Completed Wishlist].each do |collection_type|
    collection = Collection.create!(
      user: user,
      collection_type: collection_type
    )
    num_games = rand(2..3)
    video_games.sample(num_games).each do |video_game|
      CollectionVideoGame.create!(
        collection: collection,
        video_game: video_game,
        playtime: "#{rand(5..100)} hours"
      )

      Review.create!(
        title: Faker::Lorem.sentence(word_count: 3),
        body: Faker::Lorem.paragraph(sentence_count: 3),
        rating: rand(1..5),
        user: user,
        video_game: video_game
      )
    end
  end
end
