class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status, default: "pending"
      t.text :message
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
