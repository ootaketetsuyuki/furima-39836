require 'rails_helper'
RSpec.describe @user, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'passwordが空白だと登録できない' do
      @user.password = ''
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字以上の半角英数字ではないと登録できない' do
      @user.password = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = '12345'
      @user.password = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '苗字が空白では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '苗字が半角では登録できない' do
      @user.first_name = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it '名前が空白では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it '名前が半角では登録できない' do
      @user.last_name = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it '苗字が空白では登録できない' do
      @user.first_name2 = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name2 can't be blank")
    end
    it '苗字がカタカナ半角では登録できない' do
      @user.first_name2 = 'ｱｲｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name2 is invalid")
    end

    it '名前が空白では登録できない' do
      @user.last_name2 = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name2 can't be blank")
    end
    it '名前がカタカナ半角では登録できない' do
      @user.last_name2 = 'ｱｲｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name2 is invalid")
    end

    it '生年月日が--では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

