class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :shipping_address
  belongs_to :shipping_day

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
    validates :image
  end

  validates :category_id, :condition_id, :shipping_cost_id, :shipping_address_id, :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}

end
