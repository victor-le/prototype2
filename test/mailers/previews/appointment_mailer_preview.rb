# Preview all emails at http://localhost:3000/rails/mailers/appointment_mailer
class AppointmentMailerPreview < ActionMailer::Preview

    def appointment_scheduled
        AppointmentMailer.with(app_schedule: AppSchedule.last, user: User.last).appointment_scheduled
      end

end
