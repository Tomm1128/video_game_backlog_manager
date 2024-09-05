class CollectionVideoGame < ApplicationRecord
  belongs_to :collection
  belongs_to :video_game

  validates :collection_id, presence: true
  validates :video_game_id, presence: true
  validates :playtime, presence: true
end
