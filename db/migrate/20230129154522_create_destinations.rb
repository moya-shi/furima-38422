class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.references :purchase, foreign_key: true
      t.string :postcode, null: false
      t.integer :shipping_address_id, null: false
      t.string :municipality, null: false
      t.string :building
      t.string :phone_number, null:false
      t.timestamps
    end
  end
end
