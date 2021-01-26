FactoryBot.define do
  factory :item do
    name                 { '商品' }
    description          { Faker::Lorem.sentence }
    category_id          { 2 }
    product_condition_id { 2 }
    postage_payer_id     { 2 }
    prefecture_id        { 2 }
    arrival_day_id       { 2 }
    price                { 1000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/staff3.jpg'), filename: 'staff3.jpg')
    end
  end
end
