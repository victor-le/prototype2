json.extract! app_address, :id, :homeType, :homeAddress, :suiteNumber, :state, :city, :zipcode, :created_at, :updated_at
json.url app_address_url(app_address, format: :json)
