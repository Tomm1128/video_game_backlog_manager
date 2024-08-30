class CreateVideoGameGenres < ActiveRecord::Migration[7.1]
  def change
    create_table :video_game_genres do |t|
      t.references :video_game
      t.references :genre

      t.timestamps
    end
  end
end
