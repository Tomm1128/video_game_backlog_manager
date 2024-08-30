class User < ApplicationRecord
  has_many :collections
  has_many :reviews
  has_many :video_games, through: :collections
end
