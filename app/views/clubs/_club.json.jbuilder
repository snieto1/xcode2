json.extract! club, :id, :club_name, :contact_person, :club_phone_number, :club_email, :password_digest, :created_at, :updated_at
json.url club_url(club, format: :json)