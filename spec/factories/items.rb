FactoryBot.define do
  factory :item do
  title                    { 'あ' }
  description              { 'あ' }
  category_id              { '22' }
  status_id                { '23' }
  buy_cost_id                    { '4' }
  prefecture_id                    { '4' }
  buy_day_id                    { '44' }
  sale                    { '4444' }
  end

  after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end
