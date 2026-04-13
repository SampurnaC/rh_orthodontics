class CreateAppoinments < ActiveRecord::Migration[8.0]
  def change
    create_table :appoinments do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.time :time
      t.string :status, default: "pending"
      t.text :message

      t.timestamps
    end
  end
end
