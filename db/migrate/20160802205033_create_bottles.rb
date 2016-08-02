class CreateBottles < ActiveRecord::Migration[5.0]
  def change
    create_table :bottles do |t|
      t.string :name
      t.integer :price
      t.references :club, foreign_key: true

      t.timestamps
    end
  end
end
