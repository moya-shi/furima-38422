class PurchaseDestination
  include ActiveMOdel::Model
  attr_accessor :purchase, :postcode, :shipping_address, :municipality, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :shipping_address_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipality, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :user_id, :item_id, :purchase_id, :address
  end

  def save
    purchase = Purchase.create(purchase_params)
    Destination.create(destination_params)
  end

  private

  def purchase_params
    params.require(:purchase).permit(:item_id, :user_id)
  end

  def destination_params
    params.require(:destionation).permit(:postcode, :shipping_address_id, :municipality, :address, :building, :phone_number).merge(purchase_id: purchase.id)
  end
  
end