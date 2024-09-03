# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

users = User.create!([
                       { username: "gamer123", password: "password1", bio: "I love RPGs and strategy games." },
                       { username: "player_two", password: "password2",
                         bio: "Platformers and puzzle games are my jam." },
                       { username: "high_score", password: "password3", bio: "Chasing high scores in every game!" },
                     ])

genres = Genre.create!([
                         { name: "RPG" },
                         { name: "Strategy" },
                         { name: "Platformer" },
                         { name: "Puzzle" },
                         { name: "Action" },
                       ])

video_games = VideoGame.create!([
                                  { name: "The Elder Scrolls V: Skyrim",
                                    description: "An open-world RPG set in the land of Skyrim.",
                                    release_date: "2011-11-11", developer: "Bethesda Game Studios",
                                    publisher: "Bethesda Softworks", platform: "PC, PS3, Xbox 360" },
                                  { name: "Super Mario Odyssey",
                                    description: "A 3D platformer featuring Mario exploring various kingdoms.",
                                    release_date: "2017-10-27", developer: "Nintendo", publisher: "Nintendo",
                                    platform: "Nintendo Switch" },
                                  { name: "Starcraft II",
                                    description: "A real-time strategy game set in a sci-fi universe.",
                                    release_date: "2010-07-27", developer: "Blizzard Entertainment",
                                    publisher: "Blizzard Entertainment", platform: "PC" },
                                ])

VideoGameGenre.create!([
                         { video_game: video_games[0], genre: genres[0] },
                         { video_game: video_games[1], genre: genres[2] },
                         { video_game: video_games[2], genre: genres[1] },
                       ])

collections = Collection.create!([
                                   { user: users[0], collection_type: "In-Progress" },
                                   { user: users[1], collection_type: "Completed" },
                                   { user: users[2], collection_type: "Wishlist" },
                                 ])

CollectionVideoGame.create!([
                              { collection: collections[0], video_game: video_games[0], playtime: "50 hours" },
                              { collection: collections[1], video_game: video_games[1], playtime: "20 hours" },
                              { collection: collections[2], video_game: video_games[2], playtime: "10 hours" },
                            ])

Review.create!([
                 { title: "Amazing RPG!", body: "Skyrim is one of the best RPGs ever made.", rating: 5, user: users[0],
                   video_game: video_games[0] },
                 { title: "Best platformer", body: "Super Mario Odyssey is a masterpiece of platforming design.",
                   rating: 5, user: users[1], video_game: video_games[1] },
                 { title: "Intense strategy", body: "Starcraft II offers deep and rewarding strategic gameplay.",
                   rating: 4, user: users[2], video_game: video_games[2] },
               ])
