json.extract! user, :id, :name, :email, :bitcoin_address, :created_at, :updated_at
json.url user_url(user, format: :json)
