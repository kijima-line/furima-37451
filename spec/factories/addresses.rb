FactoryBot.define do
  factory :address do
    post_code { '123-4567' }
    prefecture_id { 0 }
    city { '東京都' }
    address_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number  { '09055555555' }
    item_id { '7' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
