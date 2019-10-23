class AppointmentMailer < ApplicationMailer
    helper :application
    default from: "notification@handsoflyfe.com"

def appointment_scheduled
    @app_schedule = params[:app_schedule]
    @user = params[:user]
    mail(to: @user.email, subject: "New Appointment Confirmation")
end

end
