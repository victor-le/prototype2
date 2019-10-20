class CreateAppDurations < ActiveRecord::Migration[6.0]
  def change
    create_table :app_durations do |t|
      t.integer :duration
      t.decimal :durationPrice

      t.timestamps
    end
  end
end
