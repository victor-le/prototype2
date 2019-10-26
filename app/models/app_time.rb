class AppTime < ApplicationRecord
    has_many :app_schedules

    def short_time
        appDate.strftime("%b %d %I:%M %p")
      end

end
