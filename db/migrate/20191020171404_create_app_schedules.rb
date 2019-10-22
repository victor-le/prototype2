class CreateAppSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :app_schedules do |t|
      t.string :homeAddress
      t.string :homeType
      t.string :suiteNumber
      t.string :city
      t.string :state
      t.string :zipcode
      t.datetime :appDate
      t.integer :user_id
      t.integer :service_id
      t.integer :appduration_id
      t.integer :specialrequirement_id

      t.index ["user_id"], name: "index_app_schedules_on_user_id"
      t.index ["service_id"], name: "index_app_schedules_on_service_id"
      t.index ["appduration_id"], name: "index_app_schedules_on_appduration_id"
      t.index ["specialrequirement_id"], name: "index_app_schedules_on_specialrequirement_id"

      t.timestamps
    end
  end
end
