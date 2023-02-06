FactoryBot.define do
  factory :purchase_destination do
    user_id             { Faker::Number.non_zero_digit }
    item_id             { Faker::Number.non_zero_digit }
    postcode            { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    shipping_address_id { Faker::Number.between(from: 2, to: 48) }
    municipality        {"横浜市緑区"}
    address             {"青山1-1-1"}
    building            {"柳ビル103"}
    phone_number        { Faker::Number.decimal_part(digits: 11) }
    token               { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
