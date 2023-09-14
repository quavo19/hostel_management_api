class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :room_number
      t.boolean :fan
      t.boolean :door
      t.boolean :door_lock
      t.boolean :bulb
      t.boolean :switch_and_socket
      t.boolean :fan_regulator
      t.boolean :bed

      t.timestamps
    end
  end
end
