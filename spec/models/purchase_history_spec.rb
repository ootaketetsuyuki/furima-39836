require 'rails_helper'
RSpec.describe Purchase_history, type: :model do
  before do
    @purchase_history = FactoryBot.build(:item)
  end

  describe '商品購入機能' do
    context '全ての項目が入力されていれば購入できる' do

      it '必須項目が存在すれば購入できる' do
        expect(@purchase_history).to be_valid
      end
    end  
  end
  
    context '全ての項目が入力していなければ購入できない' do
  
      it 'カード情報がトークン化されなければ購入できない' do
        @purchase_history.token = nil
        @purchase_history.valid?
        expect(@purchase_history.errors.full_messages).to include("Token can't be blank")
      end
  
      
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
    
  
  
  
  end