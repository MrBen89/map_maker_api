class CreateSquareMaps < ActiveRecord::Migration[8.0]
  def change
    create_table :square_maps do |t|
      t.text :name
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
