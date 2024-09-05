class Review < ApplicationRecord
  belongs_to :user
  belongs_to :video_game

  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
