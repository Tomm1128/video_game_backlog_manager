class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_video_games
  has_many :video_games, through: :collection_video_games

  validates :collection_type, presence: true, inclusion: { in: %w[Completed In-Progress Wishlist] }
end
