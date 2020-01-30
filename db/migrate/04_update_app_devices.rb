class UpdateAppDevices < ActiveRecord::Migration[6.0]
  def change
    change_table :app_devices do |t|
      t.string :product_image
      t.text :product_desc
    end
  end
end
