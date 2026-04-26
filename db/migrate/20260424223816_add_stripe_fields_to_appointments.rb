class AddStripeFieldsToAppointments < ActiveRecord::Migration[8.0]
  def change
    add_column :appointments, :stripe_session_id, :string
    add_index :appointments, :stripe_session_id, unique: true

    add_column :appointments, :payment_status, :string, default: "pending"
  end
end
