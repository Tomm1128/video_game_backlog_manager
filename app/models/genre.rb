class Genre < ApplicationRecord
  has_many :video_game_genres
  has_many :video_games, through: :video_game_genres
end
