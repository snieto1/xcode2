class CreateClubs < ActiveRecord::Migration[5.0]
  def change
    create_table :clubs do |t|
      t.string :club_name
      t.string :contact_person
      t.string :club_phone_number
      t.string :club_email
      t.string :password_digest

      t.timestamps
    end
  end
end
