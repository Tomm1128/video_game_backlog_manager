class CreateVideoGames < ActiveRecord::Migration[7.1]
  def change
    create_table :video_games do |t|
      t.string :name
      t.text :description
      t.string :release_date
      t.string :developer
      t.string :publisher
      t.string :platform

      t.timestamps
    end
  end
end
