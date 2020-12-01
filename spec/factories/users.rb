Factorybot.define do
  factory :user do
    nickname:              {"furima"}
    email:                 {"aaa@gmail.com"}
    password:              {"000000"}
    password_confirmation: {"000000"}
    last_name:             {"あ"}
    first_name:            {"あ"}
    last_name_kana:        {"ア"}
    first_name_kana:       {"ア"}
    birthday:              {"1930-01-01"}
  end
end