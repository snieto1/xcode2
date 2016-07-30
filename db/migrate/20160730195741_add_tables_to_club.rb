class AddTablesToClub < ActiveRecord::Migration[5.0]
  def change
    add_reference :clubs, :tables, foreign_key: true
  end
end
