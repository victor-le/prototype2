class AppointmentMailer < ApplicationMailer
    helper :application
    default from: 'handsoflyfedemo@gmail.com'

def appointment_scheduled
    @app_schedule = params[:app_schedule]
    @user = params[:user]
    mail(to: @user.email, subject: "Your Appointment has been Scheduled")
    #mail(to: @user.email, subject: "New Appointment Confirmation")
end

def cancel_appointment
    @app_schedule = params[:app_schedule]
    mail(to: @app_schedule.user.email, subject: "Your Appointment has been Cancelled")
end

def update_appointment
    @app_schedule = params[:app_schedule]
    mail(to: @app_schedule.user.email, subject: "Your Appointment has Updated")
end

def notify_appointment
    @app_schedule = params[:app_schedule]
   # @user = params[:user]
    mail(to: "handsoflyfedemo@gmail.com", subject: "New Appointment Scheduled")
end

def notify_appointment_update
    @app_schedule = params[:app_schedule]
   # @user = params[:user]
    mail(to: "handsoflyfedemo@gmail.com", subject: "Appointment Updated")
end

def notify_appointment_cancel
    @app_schedule = params[:app_schedule]
   # @user = params[:user]
    mail(to: "handsoflyfedemo@gmail.com", subject: "Appointment Cancelled")
end




end
