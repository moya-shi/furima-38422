FactoryBot.define do
  factory :purchase_destination do
    postcode            {"123-4567"}
    shipping_address_id {"2"}
    municipality        {"横浜市緑区"}
    address             {"青山1-1-1"}
    building            {"柳ビル103"}
    phone_number        {"09012345678"}
  end
end
