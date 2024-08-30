class CollectionVideoGame < ApplicationRecord
  belongs_to :collection
  belongs_to :video_game
end
