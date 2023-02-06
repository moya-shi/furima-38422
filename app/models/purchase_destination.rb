class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :postcode, :shipping_address_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :shipping_address_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipality, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :address
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Destination.create(postcode: postcode, shipping_address_id: shipping_address_id, municipality: municipality, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end