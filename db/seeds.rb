
if AppSetting.find_by_id(1).nil?
  AppSetting.create(id: 1, status: "okay", version_number: "94c6a0" )
end

[*1..12].each do |d|
  AppDevice.create(
    manufacturer: Faker::Device.manufacturer,
    device_name: Faker::Device.model_name,
    platform: Faker::Device.platform,
    serial: Faker::Device.serial,
    product_image: Faker::Avatar.image(size: "300x200"),
    product_desc: Faker::Lorem.paragraph(sentence_count: 2)
  )
end
