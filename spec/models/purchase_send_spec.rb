require 'rails_helper'
RSpec.describe PurchaseSend, type: :model do
  before do
    @purchase_send = FactoryBot.build(:purchase_send)
  end

    describe '商品購入機能' do
      context '全ての必須項目が入力されていれば購入できる' do
        it '必須項目が存在すれば購入できる' do
          user = FactoryBot.create(:user)
          item = FactoryBot.create(:item)
          @purchase_send.user_id = user.id
          @purchase_send.item_id = item.id
          expect(@purchase_send).to be_valid
        end

        it '建物名があれば登録できる' do
          @purchase_send.building = nil
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
          @purchase_send.prefecture_id = '1'
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

        it '建物名の空白でも登録できる' do
          @purchase_send.building = nil
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

        it 'phone_numberが9桁以内だと購入できない' do
          @purchase_send.phone_number = '090123456'
          @purchase_send.valid?
          expect(@purchase_send.errors[:phone_number]).to include("is invalid")
        end

        it 'phone_numberが12桁以上だと購入できない' do
          @purchase_send.phone_number = '0901234567890'
          @purchase_send.valid?
          expect(@purchase_send.errors[:phone_number]).to include("is invalid")
        end
        
        it 'user_idが紐付いていないと購入できない' do
          @purchase_send.user_id = nil
          @purchase_send.valid?
          expect(@purchase_send.errors.full_messages).to include("User can't be blank")
        end

        it 'item_idが紐付いていないと購入できない' do
          @purchase_send.user_id = nil
          @purchase_send.valid?
          expect(@purchase_send.errors.full_messages).to include("Item can't be blank")
        end
      end  
    end
end
