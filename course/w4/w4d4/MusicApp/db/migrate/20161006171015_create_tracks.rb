class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :track_pos
      t.integer :album_id, null: false

      t.timestamps null: false
    end
  end
end
