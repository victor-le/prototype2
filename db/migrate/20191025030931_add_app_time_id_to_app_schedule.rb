class AddAppTimeIdToAppSchedule < ActiveRecord::Migration[6.0]
  def change
    add_reference :app_schedules, :app_time, index: true
    add_foreign_key :app_schedules, :app_times
  end
end
