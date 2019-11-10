class AppSchedule < ApplicationRecord
 # after_create :send_appointment_email
  belongs_to :user,
             foreign_key: "user_id"
  belongs_to :service,
             foreign_key: "service_id" 
  belongs_to :app_duration,
             foreign_key: "appduration_id" 
  belongs_to :special_requirement,
             foreign_key: "specialrequirement_id" 
  belongs_to :app_time,
             foreign_key: "app_time_id"
             

  validates :homeAddress, presence: true
  validates :homeType, presence: true
  validates :state, presence: true, length: {maximum: 2}
  validates :city, presence: true
  validates :zipcode, presence: true

  def self.to_csv
    attributes = %w{homeAddress homeType suiteNumber city state zipcode comment appDate user_id service_id appduration_id specialrequirement_id app_time_id}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |app_schedule|
        csv << app_schedule.attributes.values_at(*attributes)
      end
    end
  end

  def start_time
    self.app_time.appDate
  end

  #def send_appointment_email
   # AppointmentMailer.appointment_scheduled(app_schedule: self, user: self.user).deliver
  #end
end
