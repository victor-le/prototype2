class CreateAppTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :app_times do |t|
      t.datetime :appDate

      t.timestamps
    end
  end
end
