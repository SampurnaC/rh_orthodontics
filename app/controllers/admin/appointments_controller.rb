class Admin::AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @appointments=Appointment.includes(:user, :slot).where(payment_status: "paid").order(created_at: :desc)
  end
  
  private
  
  def require_admin
    redirect_to root_path, alert: "Not authorized" unless current_user.admin?
  end
end
