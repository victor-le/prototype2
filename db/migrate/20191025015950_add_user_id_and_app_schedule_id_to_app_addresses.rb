class AddUserIdAndAppScheduleIdToAppAddresses < ActiveRecord::Migration[6.0]
  def change
    add_reference :app_addresses, :user, index: true
    add_reference :app_addresses, :app_schedule, index: true
    add_foreign_key :app_addresses, :users
    add_foreign_key :app_addresses, :app_schedules
  end


end
