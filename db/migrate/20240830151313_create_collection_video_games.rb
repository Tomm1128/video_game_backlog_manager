class CreateCollectionVideoGames < ActiveRecord::Migration[7.1]
  def change
    create_table :collection_video_games do |t|
      t.references :collection
      t.references :video_game
      t.string :playtime

      t.timestamps
    end
  end
end
