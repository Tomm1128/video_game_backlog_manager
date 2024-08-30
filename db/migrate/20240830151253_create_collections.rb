class CreateCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :collections do |t|
      t.references :user
      t.string :collection_type

      t.timestamps
    end
  end
end
