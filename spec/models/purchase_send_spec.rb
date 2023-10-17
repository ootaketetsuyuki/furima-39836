require 'rails_helper'
RSpec.describe PurchaseSend, type: :model do
  before do
    @purchase_send = FactoryBot.build(:purchase_send)
  end

    describe '商品購入機能' do
      context '全ての必須項目が入力されていれば購入できる' do
        it '必須項目が存在すれば購入できる' do
          expect(@purchase_send).to be_valid
        end
      end

      context '全ての必須項目が入力していなければ購入できない' do
        it 'tokenが存在しなければ購入できない' do
          @purchase_send.token = nil
          @purchase_send.valid?
          expect(@purchase_send.errors[:token]).to include("can't be blank")
        end

        it 'post_codeが空白だと購入できない' do
          @purchase_send.post_code = ''
          @purchase_send.valid?
          expect(@purchase_send.errors[:post_code]).to include("can't be blank")
        end

        it 'post_codeにハイフンの入力がないと購入できない' do
          @purchase_send.post_code = 1234567
          @purchase_send.valid?
          expect(@purchase_send.errors[:post_code]).to include("is invalid. Include hyphen(-)")
        end

        it 'prefecture_idが---では登録できない' do
          @purchase_send.prefecture_id = '---'
          @purchase_send.valid?
          expect(@purchase_send.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'city_nameが空白だと購入できない' do
          @purchase_send.city_name = ''
          @purchase_send.valid?
          expect(@purchase_send.errors[:city_name]).to include("can't be blank")
        end

        it 'street_addressが空白だと購入できない' do
          @purchase_send.street_address = ''
          @purchase_send.valid?
          expect(@purchase_send.errors[:street_address]).to include("can't be blank")
        end

        it 'phone_numberが空白だと購入できない' do
          @purchase_send.phone_number = ''
          @purchase_send.valid?
          expect(@purchase_send.errors[:phone_number]).to include("can't be blank")
        end

        it 'phone_numberが数字以外だと購入できない' do
          @purchase_send.phone_number = '@あァa'
          @purchase_send.valid?
          expect(@purchase_send.errors[:phone_number]).to include("is invalid")
        end

        it 'phone_numberが10桁以上11桁以内でなければ値購入できない' do
          @purchase_send.phone_number = '090-1234-5678'
          @purchase_send.valid?
          expect(@purchase_send.errors[:phone_number]).to include("is invalid")
        end
      end  
    end
end
