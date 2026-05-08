class AddSlotToAppointments < ActiveRecord::Migration[8.0]
  def change
    add_reference :appointments, :slot, foreign_key: true
  end
end
