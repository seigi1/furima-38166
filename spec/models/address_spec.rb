require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '住所登録' do
    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@address).to be_valid
      end

      it 'buiding_nameは空でも保存できる' do
        @address.building_name = ''
        expect(@address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @address.postal_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Postal code can't be blank"
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        # @item.item_name = ''
        # @item.valid?
        # expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it 'prefectureを選択していないと保存できない' do
        # @item.item_name = 'a' * 50
        # @item.valid?
        # expect(@item.errors.full_messages).to include 'Item name is too long (maximum is 40 characters)'
      end

      it 'cityが空では保存できない' do
        # @item.explanation = ''
        # @item.valid?
        # expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end

      it 'house_numberが空では保存できない' do
        # @item.explanation = ''
        # @item.valid?
        # expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end

      it 'phone_numberが空だと保存できない' do
        # @item.explanation = 'a' * 1050
        # @item.valid?
        # expect(@item.errors.full_messages).to include 'Explanation is too long (maximum is 1000 characters)'
      end

      it 'phone_numberは10桁以上11桁以内の半角数値でないと保存できない' do
        # @item.explanation = 'a' * 1050
        # @item.valid?
        # expect(@item.errors.full_messages).to include 'Explanation is too long (maximum is 1000 characters)'
      end

      it 'purchaseが紐づいていないと保存できない' do
        # @item.category_id = 0
        # @item.valid?
        # expect(@item.errors.full_messages).to include "Category can't be blank"
      end
    end
  end
end
