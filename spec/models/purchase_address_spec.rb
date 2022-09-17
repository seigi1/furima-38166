require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user, item_id: @item)
    sleep 0.1
  end

  describe '商品購入記録' do
    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end

      it 'buiding_nameは空でも保存できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Token can't be blank"
      end

      it 'postal_codeが空だと保存できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code can't be blank"
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end

      it 'prefectureを選択していないと保存できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'cityが空では保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "City can't be blank"
      end

      it 'house_numberが空では保存できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "House number can't be blank"
      end

      it 'phone_numberが空だと保存できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number can't be blank"
      end

      it 'phone_numberは10桁以上11桁以内の半角数値でないと保存できない' do
        @purchase_address.phone_number = '123456789101'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Phone number is invalid'
      end

      it 'phone_numberは半角数値でないと保存できない' do
        @purchase_address.phone_number = '１２３４５６７８９１０'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'Phone number is invalid'
      end

      it 'userが紐づいていないと保存できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "User can't be blank"
      end

      it 'itemが紐づいていないと保存できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
