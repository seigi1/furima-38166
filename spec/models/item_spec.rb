require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品' do
    context '新規出品ができるとき' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規出品できないとき' do
      it 'imageを1枚つけないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'item_nameが空では保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it 'item_nameは40文字以下でないと保存できない' do
        @item.item_name = "a" * 50
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name is too long (maximum is 40 characters)"
      end

      it 'explanationが空では保存できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end

      it '説明は1,000文字以下でないと保存できない' do
        @item.explanation = 'a' * 1050
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation is too long (maximum is 1000 characters)"
      end

      it 'category_idを選択していないと保存できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it 'content_idを選択していないと保存できない' do
        @item.content_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Content can't be blank"
      end

      it 'deliver_charge_idを選択していないと保存できない' do
        @item.deliver_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Deliver charge can't be blank"
      end

      it 'deliver_day_idを選択していないと保存できない' do
        @item.deliver_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Deliver day can't be blank"
      end

      it 'prefecture_idを選択していないと保存できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
    
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが全角数字だと保存できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it 'priceが299円以下だと保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it 'priceが10,000,000以上は保存できない' do
        @item.price = '10000001'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end


end
