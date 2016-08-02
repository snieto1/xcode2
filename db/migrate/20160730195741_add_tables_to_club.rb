class AddTablesToClub < ActiveRecord::Migration[5.0]
  def change
    add_reference :tables, :club, foreign_key: true
  end
end
