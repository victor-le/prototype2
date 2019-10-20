class DropSpecialIndexes < ActiveRecord::Migration[6.0]
  def up
    remove_column :app_schedules, :specialrequirement_id
  end
end
