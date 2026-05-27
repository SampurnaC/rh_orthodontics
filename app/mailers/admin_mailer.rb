class AdminMailer < ApplicationMailer
  default from: ENV['GMAIL_USERNAME']
  def new_booking(appointment)
    @appointment = appointment
    mail(to: ENV['GMAIL_USERNAME'], subject: "New Appointment Booked")
  end
end
