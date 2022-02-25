FactoryBot.define do
  factory :address do
    post_code { '123-4567' }
    prefecture_id { '5' }
    city { '東京都' }
    address_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number  { '090-5555-5555' }
  end
end
