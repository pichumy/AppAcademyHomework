class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :title, null: false
      t.date :year, null: false
      t.boolean :state, default: true 
    end
      add_index :albums, [:band_id, :title], unique: true
  end
end
