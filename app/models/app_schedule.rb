class AppSchedule < ApplicationRecord
  belongs_to :user
            #  foreign_key: "user_id"
  belongs_to :service
            #  foreign_key: "service_id" 
  belongs_to :app_duration
            #  foreign_key: "appduration_id" 
  belongs_to :special_requirement
            #  foreign_key: "specialrequirement_id" 
  belongs_to :app_time
            #  foreign_key: "app_time_id"
             

  validates :homeAddress, presence: true
  validates :homeType, presence: true
  validates :state, presence: true, length: {maximum: 2}, inclusion: { in: %w(NC), message: "%{value} is not a valid state" }
  validates :city, presence: true
  validates :zipcode, presence: true
  validates :zipcode, length: { is: 5 }
  

CSV_HEADER = %w{Appointment_Time_Slot Client_Name Service Service_Price Duration Duration_Price Home_Address Home_Type Suite_Number City State Zipcode Comment Special_Requirements}
  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << CSV_HEADER
      all.each do |app_schedule|
        csv << [
          app_schedule.app_time.appDate,
          app_schedule.user.name,
          app_schedule.service.serviceName,
          app_schedule.service.servicePrice,
          app_schedule.app_duration.duration,
          app_schedule.app_duration.durationPrice,
           app_schedule.homeAddress,
            app_schedule.homeType,
           app_schedule.suiteNumber,
            app_schedule.city,
            app_schedule.state,
            app_schedule.zipcode,
            app_schedule.comment,
            app_schedule.special_requirement.requirementDesc
            ]
      end
    end
  end

  def start_time
    self.app_time.appDate
  end

end
