class VideoGame < ApplicationRecord
  has_many :reviews
  has_many :video_game_genres
  has_many :genres, through: :video_game_genres
  has_many :collection_video_games
  has_many :collections, through: :collection_video_games

  validates :name, presence: true
  validates :description, presence: true
  validates :release_date, presence: true
  validates :developer, presence: true
  validates :publisher, presence: true
  validates :platform, presence: true

  def average_rating
    average = Review.where(video_game_id: id).average(:rating)
    average.nil? ? 0 : average.round(2)
  end

  scope :top_rated, -> {
    joins(:reviews)
      .select("video_games.*, AVG(reviews.rating) AS average_rating")
      .group("video_games.id")
      .order("average_rating DESC")
  }
end
