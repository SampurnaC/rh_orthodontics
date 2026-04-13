class AppointmentsController < ApplicationController
  
  def new
    @appointment=Appointment.new
  end

  def create
    @appointment=Appointment.new(appointment_params)
    @appointment.user=current_user if user_signed_in?
    if @appointment.save
      redirect_to root_path, notice: "Appointment successfully created"
    else
      render :new
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:name, :email, :phone, :message)    
  end

end
