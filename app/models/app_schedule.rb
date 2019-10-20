class AppSchedule < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :app_address, optional: true
  belongs_to :app_time, optional: true
  belongs_to :service, optional: true
  belongs_to :app_duration, optional: true
  belongs_to :special_requirement, optional: true
end
