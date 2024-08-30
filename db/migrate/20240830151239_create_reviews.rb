class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.decimal :rating
      t.references :user
      t.references :video_game

      t.timestamps
    end
  end
end
