FactoryBot.define do
  factory :buyer do
    association :item
    post_code       { '123-4567' }
    city            { '東京都' }
    prefecture_id   { '4' }
    address_number { '1-1' }
    building_name  { '東京ハイツ' }
    phone_number  { '090-5555-5555' }
    buyer_id      { '9' }
  end
end
