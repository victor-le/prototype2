class AppAddress < ApplicationRecord
    belongs_to :app_schedule,
                foreign_key: "app_schedule_id"
    belongs_to :user,
                foreign_key: "user_id"
end
