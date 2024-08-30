class User < ApplicationRecord
  has_secure_password

  has_many :collections
  has_many :reviews
  has_many :video_games, through: :collections

  validates :username, presence: true, uniqueness: true
  validates :bio, presence: true
end
