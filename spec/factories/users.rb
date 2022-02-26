FactoryBot.define do
  factory :user do
    nickname                    { 'abe' }
    email                       {Faker::Internet.free_email}
    password                    { 'aaaaa1' }
    password_confirmation       { password }
    first_name { 'あ' }
    last_name { 'い' }
    first_name_kana { 'ア' }
    last_name_kana              { 'イ' }
    birth_day                   { '1999-10-10' }
  end
end
