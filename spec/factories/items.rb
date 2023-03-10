FactoryBot.define do
  factory :item do

    name                {Faker::Commerce.product_name}
    explanation         {Faker::Lorem.sentence(word_count: 10)}
    category_id         {Faker::Number.between(from: 2, to: 11)}
    condition_id        {Faker::Number.between(from: 2, to: 7)}
    shipping_cost_id    {Faker::Number.between(from: 2, to: 3)}
    shipping_address_id {Faker::Number.between(from: 2, to: 48)}
    shipping_day_id     {Faker::Number.between(from: 2, to: 4)}
    price               {Faker::Number.between(from: 300, to: 9999999)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
