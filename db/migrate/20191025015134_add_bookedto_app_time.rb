class AddBookedtoAppTime < ActiveRecord::Migration[6.0]
  def change
    add_column :app_times, :booked, :boolean, default: false, null: false
  end
end
