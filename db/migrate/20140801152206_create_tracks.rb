class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :title, null: false
      t.integer :track_number, null: false
      t.text :lyrics, null: false
      t.string :track_type, null: false
    end

    add_index :tracks, [:title, :album_id], unique: true
  end
end
