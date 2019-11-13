class AppTime < ApplicationRecord
    has_many :app_schedules

    validates_uniqueness_of :appDate

    def short_time
        appDate.strftime("%b %d %I %p")
      end

end
