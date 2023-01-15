require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる時' do
      it '全てのデータが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない時' do
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーが選択されていなければ登録できない' do
        @item.category_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が選択されていなければ登録できない' do
        @item.condition_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料負担が選択されていなければ登録できない' do
        @item.shipping_cost_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it '配送元の地域が選択されていなければ登録できない' do
        @item.shipping_address_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping address can't be blank")
      end
      it '配送までの日数が選択されていなければ登録できない' do
        @item.shipping_day_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが9999999より大きければ登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが全角数値では登録できない' do
        @item.price = '９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが数値以外では登録できない' do
        @item.price = 'テスト'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    #   it 'passwordが空では登録できない' do
    #     @user.password = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password can't be blank")
    #   end
    #   it 'passwordが6文字未満では登録できない' do
    #     @user.password = 'pass1'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    #   end
    #   it 'passwordがアルファベットのみでは登録できない' do
    #     @user.password = 'aaaaaa'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    #   end
    #   it 'passwordが数字のみでは登録できない' do
    #     @user.password = '111111'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    #   end
    #   it '全角文字を含むpasswordでは登録できない' do
    #     @user.password = 'あいうえお'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    #   end
    #   it 'passwordとpassword_confirmationが一致しないと登録できない' do
    #     @user.password = 'password1'
    #     @user.password_confirmation = 'password2'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    #   end
    #   it 'last_nameが空では登録できないこと' do
    #     @user.last_name = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Last name can't be blank")
    #   end
    #   it 'first_nameが空では登録できないこと' do
    #     @user.first_name = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("First name can't be blank")
    #   end
    #   it 'last_name_kanaが空では登録できないこと' do
    #     @user.last_name_kana = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    #   end
    #   it 'first_name_kanaが空では登録できないこと' do
    #     @user.first_name_kana = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("First name kana can't be blank")
    #   end
    #   it 'last_nameが全角入力でなければ登録できないこと' do
    #     @user.last_name = 'ﾃｽﾄ'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Last name is invalid")
    #   end
    #   it 'first_nameが全角入力でなければ登録できないこと' do
    #     @user.first_name = 'ﾃｽﾄ'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("First name is invalid")
    #   end
    #   it 'last_name_kanaが全角カタカナ入力でなければ登録できないこと' do
    #     @user.last_name_kana = 'てすと'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Last name kana is invalid")
    #   end
    #   it 'first_name_kanaが全角カタカナ入力でなければ登録できないこと' do
    #     @user.first_name_kana = 'てすと'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("First name kana is invalid")
    #   end
    #   it 'birthdayが空では登録できない' do
    #     @user.birthday = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Birthday can't be blank")
    #   end
    end
  end
end
