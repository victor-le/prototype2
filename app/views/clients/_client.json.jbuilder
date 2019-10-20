json.extract! client, :id, :clientFName, :clientLName, :clientEmail, :clientPhone, :created_at, :updated_at
json.url client_url(client, format: :json)
