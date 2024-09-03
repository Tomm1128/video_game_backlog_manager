class User < ApplicationRecord
  has_secure_password

  has_many :collections
  has_many :reviews
  has_many :video_games, through: :collections

  validates :username, presence: true, uniqueness: true
  validates :bio, presence: true

  def collection_by_type(collection_type)
    return unless collections.where(collection_type: collection_type).any?

    collection = collections.where(collection_type: collection_type)
    collection.first.video_games
  end
end
