class Admin::SlotsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin


  def index
    @slots = Slot.order(start_time: :asc)
  end

  def new
    @slot=Slot.new
  end

  def create
    @slot=Slot.new(slot_params)
    if @slot.save
      redirect_to admin_slots_path, notice: "Slot successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @slot=Slot.find(params[:id])
    if @slot.update(slot_params)
      redirect_to admin_slots_path, notice: "Slot successfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @slot=Slot.find(params[:id])
    @slot.destroy
    redirect_to admin_slots_path, notice: "Slot successfully deleted!"
  end

  private
  
  def require_admin
    redirect_to root_path, alert: "Not authorized" unless current_user.admin?
  end

  def slot_params
    params.require(:slot).permit(:start_time, :available)
  end

end
