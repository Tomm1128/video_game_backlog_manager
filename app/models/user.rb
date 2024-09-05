class User < ApplicationRecord
  has_secure_password

  has_many :collections
  has_many :reviews
  has_many :video_games, through: :collections
  has_many :reviewed_video_games, through: :reviews, source: :video_game

  validates :username, presence: true, uniqueness: true
  validates :bio, presence: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  def collection_by_type(collection_type)
    return unless collections.where(collection_type: collection_type).any?

    collection = collections.where(collection_type: collection_type)
    collection.first.video_games
  end

  def reviewed_video_game?(video_game_id)
    video_game = VideoGame.find(video_game_id)
    reviewed_video_games.include?(video_game)
  end
end
