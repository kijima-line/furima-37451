FactoryBot.define do
  factory :region do
    post_code { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    address_number { '1-1' }
    building_name { '東京ハイツ' }
    sale { 2000 }
  end
end
