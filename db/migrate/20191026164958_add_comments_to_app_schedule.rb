class AddCommentsToAppSchedule < ActiveRecord::Migration[6.0]
  def change
    add_column :app_schedules, :comment, :string
  end
end
