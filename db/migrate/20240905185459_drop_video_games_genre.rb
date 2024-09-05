class DropVideoGamesGenre < ActiveRecord::Migration[7.1]
  def change
    drop_table :video_game_genres
  end
end
