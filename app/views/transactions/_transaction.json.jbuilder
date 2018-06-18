json.extract! transaction, :id, :to_user_id, :to_user_address, :from_address, :currency, :status, :response, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
