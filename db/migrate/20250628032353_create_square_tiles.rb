class CreateSquareTiles < ActiveRecord::Migration[8.0]
  def change
    create_table :square_tiles do |t|
      t.text :map, array: true, default: []

      t.timestamps
    end
  end
end
