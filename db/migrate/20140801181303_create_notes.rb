class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.integer :track_id
      t.text :text

      t.timestamps
    end

    add_index :notes, [:user_id, :track_id], unique: true
  end
end
