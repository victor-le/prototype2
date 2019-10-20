json.extract! app_schedule, :id, :homeAddress, :homeType, :suiteNumber, :city, :state, :zipcode, :user_id, :service_id, :appduration_id, :specialrequirement_id, :created_at, :updated_at
json.url app_schedule_url(app_schedule, format: :json)
