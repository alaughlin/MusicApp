class FixLyricsColumnInTracks < ActiveRecord::Migration
  def change
    remove_column :tracks, :lyrics
    add_column :tracks, :lyrics, :text
  end
end
