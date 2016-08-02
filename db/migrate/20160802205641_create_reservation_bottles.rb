class CreateReservationBottles < ActiveRecord::Migration[5.0]
  def change
    create_table :reservation_bottles do |t|
      t.references :reservation, foreign_key: true
      t.references :bottle, foreign_key: true

      t.timestamps
    end
  end
end
