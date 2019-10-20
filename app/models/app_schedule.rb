class AppSchedule < ApplicationRecord
  belongs_to :user
  belongs_to :service
  belongs_to :app_duration, optional: true
  belongs_to :special_requirement, optional: true

  def start_time
    self.appDate
  end

end
