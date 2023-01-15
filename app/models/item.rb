class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_cost, :shipping_address, :shipping_day

  validates :name, :explain, :price, presence: true
  validates :category_id, :condition_id, :shipping_cost_id, :shipping_address_id, :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}

end
