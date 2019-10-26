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
             

#  has_many :app_addresses

  def start_time
    self.app_time.appDate
  end

  #def book
    #@app_time = AppTime.find(params[:id])
    #@app_time.update_attribute(:booked, true)
  #end
  #def send_appointment_email
   # AppointmentMailer.appointment_scheduled(app_schedule: self, user: self.user).deliver
  #end

end
