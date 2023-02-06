require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_destination = FactoryBot.build(:purchase_destination, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end
  describe '購入内容確認' do
    context '商品購入できる時' do
      it '全てのデータが存在すれば購入できる' do
        expect(@purchase_destination).to be_valid
      end
      it '建物名が空でも購入できる' do
        @purchase_destination.building = ""
        expect(@purchase_destination).to be_valid
      end
    end
    context '商品購入ができない時' do
      it '郵便番号が空だと購入できない' do
        @purchase_destination.postcode = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号にハイフンがないと購入できない' do
        @purchase_destination.postcode = "1234567"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postcode is invalid")
      end
      it '都道府県が未選択では購入できない' do
        @purchase_destination.shipping_address_id = "1"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Shipping address can't be blank")
      end
      it '市町村が空では購入できない' do
        @purchase_destination.municipality = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空では購入できない' do
        @purchase_destination.address = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では購入できない' do
        @purchase_destination.phone_number = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が10桁未満の数字では登録できない' do
        @purchase_destination.phone_number = 0 + Faker::Number.between(from: 0, to: 99999999)
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上の数字では登録できない' do
        @purchase_destination.phone_number = 0 + Faker::Number.between(from: 99999999999, to: 99999999999999999999)
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が全角数値では登録できない' do
        @purchase_destination.phone_number = "０９０１２３４５６７８"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が数値以外では登録できない' do
        @purchase_destination.phone_number = '----------'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが空では登録できない' do
        @purchase_destination.user_id = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できない' do
        @purchase_destination.item_id = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Item can't be blank")
      end
      it 'トークンが空では保存できないこと' do
        @purchase_destination.token = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end