class AppointmentsController < ApplicationController
  
  def new
    @slots=Slot.available
    @appointment=Appointment.new
  end

  def create
    @appointment=Appointment.new(appointment_params)
    @appointment.user=current_user if user_signed_in?
    if @appointment.save
      @appointment.slot.update(available: false)
      redirect_to @appointment, notice: "Appointment successfully booked!"
    else
      @slots=Slot.available
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @appointment=Appointment.find(params[:id])
  end

  private
  def appointment_params
    params.require(:appointment).permit(:name, :email, :phone, :message, :slot_id)    
  end

end
