
if AppSetting.find_by_id(1).nil?
  AppSetting.create(id: 1, status: "okay", version_number: "94c6a0" )
end

%w(autsimiliqueperferendis.png culpasuntut.png eaconsequaturodio.png esserationeexcepturi.png estquidemanimi.png ipsammodiqui.png liberositexercitationem.png nequevoluptatemvoluptate.png nostrumvoluptasnumquam.png quidemomnisdolor.png veniampossimusquasi.png voluptatemrationequis.png).each do |d|
  AppDevice.create(
    manufacturer: Faker::Device.manufacturer,
    device_name: Faker::Device.model_name,
    platform: Faker::Device.platform,
    serial: Faker::Device.serial,
    product_image: "images/robo/#{d}",
    product_desc: Faker::Lorem.paragraph(sentence_count: 2)
  )
end
