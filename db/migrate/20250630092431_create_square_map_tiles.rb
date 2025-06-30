class CreateSquareMapTiles < ActiveRecord::Migration[8.0]
  def change
    create_table :square_map_tiles do |t|
      t.integer :x_pos
      t.integer :y_pos
      t.integer :tile_type, default: 0
      t.integer :layer, default: 0
      t.references :square_map, null: false, foreign_key: true
      t.references :square_tile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
