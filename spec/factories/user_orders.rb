FactoryBot.define do
  factory :user_order do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city          { '上尾市' }
    house_number  { '本町1-1-1' }
    building      { '本町ビル' }
    phone_number  { '08000000000' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
