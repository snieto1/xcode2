json.extract! table, :id, :table_name, :minimum, :created_at, :updated_at
json.url table_url(table, format: :json)