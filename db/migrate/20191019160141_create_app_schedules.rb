class CreateAppSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :app_schedules do |t|
      t.references :client, null: false, foreign_key: true
      t.references :appaddress, null: false, foreign_key: true
      t.references :apptime, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.references :appduration, null: false, foreign_key: true
      t.references :specialrequirement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
