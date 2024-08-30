class VideoGame < ApplicationRecord
  has_many :reviews
  has_many :video_game_genres
  has_many :genres, through: :video_game_genres
  has_many :collection_video_games
  has_many :collections, through: :collection_video_games
end
