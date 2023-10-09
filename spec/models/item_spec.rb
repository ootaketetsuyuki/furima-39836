require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '全ての項目が入力されていれば出品できる' do
      it '必須項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '全ての項目が入力していなければ出品できない' do
      it 'item_nameが空白では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors[:item_name]).to include("can't be blank")
      end
      
      it 'descriptionが空白では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが---では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'situation_idが---では出品できない' do
        @item.situation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end

      it 'prefecture_idが---では出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'address_idが---では出品できない' do
        @item.address_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Address can't be blank")
      end

      it 'day_idが---では出品できない' do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end

      it 'priceが空白では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end

      it 'priceが299以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include('must be greater than or equal to 300')
      end

      it 'priceが10000000以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors[:price]).to include('must be less than or equal to 9999999')
      end

      it 'priceが半角数字以外では出品できない' do
        @item.price = 'あいうｱｲｳ'
        @item.valid?
        expect(@item.errors[:price]).to include('is not a number')
      end

      it 'useruserが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '商品画像が空では出品出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item).not_to be_valid
      end
    end
  end
end
