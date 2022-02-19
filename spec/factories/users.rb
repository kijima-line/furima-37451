FactoryBot.define do
  factory :user do
    nickname                    {"abe"}
    email                       {"kkk@gmail.com"}
    password                    {"00000000"}
    password_confirmation       {"00000000"}
    fist_name                   {'あ'}
    last_name                   {'い'}
    fist_name_kana              {'ア'}
    last_name_kana              {'イ'}
    birth_day                   {'1999/10/10'}


  end
end