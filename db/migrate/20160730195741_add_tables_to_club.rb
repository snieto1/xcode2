class AddTablesToClub < ActiveRecord::Migration[5.0]
  def change
    add_reference :tables, :clubs, foreign_key: true
  end 
end
