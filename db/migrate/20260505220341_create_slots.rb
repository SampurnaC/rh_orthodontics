class CreateSlots < ActiveRecord::Migration[8.0]
  def change
    create_table :slots do |t|
      t.datetime :start_time
      t.boolean :available

      t.timestamps
    end
  end
end
