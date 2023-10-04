require 'rails_helper'
RSpec.describe User, type: :model do
  # before do
  #   @user = FactoryBot.build(:user)
  # end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it 'passwordが空白、6文字以上の半角英数字ではないと登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid? 
      expect(user.errors.full_messages).to include("Password can't be blank")
      user.password = 'abc'
      user.valid? 
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      user.password = 'password123'
      user.valid? 
      expect(user.errors.full_messages).not_to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      user = FactoryBot.build(:user)
      user.password = password_confirmation
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it '苗字が空白、半角では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
      expect(user.errors.full_messages).to include("First name is invalid")
    end

    it '名前が空白、半角では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
      expect(user.errors.full_messages).to include("Last name is invalid")
    end

    it '苗字が空白、カタカナ半角では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name2 = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
      expect(user.errors.full_messages).to include("First name is invalid")
    end

    it '名前が空白、カタカナ半角では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name2 = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
      expect(user.errors.full_messages).to include("Last name is invalid")
    end

    it '生年月日が--では登録できない' do
      user = FactoryBot.build(:user)
      user.birthday = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

