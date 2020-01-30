class CreateAppDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :app_devices do |t|
      t.string :manufacturer
      t.string :device_name
      t.string :platform
      t.string :serial
    end
  end
end
