FactoryBot.define do
  factory :item do
    association :user

    name { Faker::Name.name }
    detail { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    shipping_area_id { 2 }
    shipping_day_id { 2 }
    price { 300 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
