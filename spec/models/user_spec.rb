require 'rails_helper'
RSpec.describe @user, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '全ての項目が入力されていれば登録できる' do
      it 'nicknameが入力されていれば登録できる' do
        @user.nickname = 'nickname'
        @user.valid?
        expect(@user.errors[:nickname]).to be_empty
      end

      it 'emailが半角英数字と@が入力されていれば登録できる' do
        @user.email = 'tech123@co.jp'
        @user.valid?
        expect(@user.errors[:email]).to be_empty
      end

      it 'passwordが6文字以上の半角英数字が入力されていれば登録できる' do
        @user.password = 'abc1234'
        @user.valid?
        expect(@user.errors[:password]).to be_empty
      end
      it 'passwordとpassword_confirmationが入力されていれば登録できる' do
        @user.password_confirmation = 'abc1234'
        @user.password = 'abc1234'
        @user.valid?
        expect(@user.errors[:password]).to be_empty
      end

      it '苗字が全角入力されていれば登録できる' do
        @user.first_name = '山田'
        @user.valid?
        expect(@user.errors[:first_name]).to be_empty
      end

      it '名前が全角入力されていれば登録できる' do
        @user.last_name = '太郎'
        @user.valid?
        expect(@user.errors[:last_name]).to be_empty
      end

      it '苗字が全角カタカナ入力されていれば登録できる' do
        @user.first_name2 = 'ヤマダ'
        @user.valid?
        expect(@user.errors[:first_name]).to be_empty
      end

      it '名前が全角カタカナ入力されていれば登録できる' do
        @user.last_name2 = 'タロウ'
        @user.valid?
        expect(@user.errors[:first_name]).to be_empty
      end

      it '生年月日が入力されていれば登録できる' do
        @user.birthday = Date.new(1930, 1, 1)
        @user.valid?
        expect(@user.errors[:birthday]).to be_empty
      end
    end

    context '新規登録がうまくいかないとき' do
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

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空白だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以上の半角英数字ではないと登録できない' do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = '12345'
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'あa1いb2うc3'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it '苗字が空白では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '苗字が半角では登録できない' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it '名前が空白では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名前が半角では登録できない' do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it '苗字が空白では登録できない' do
        @user.first_name2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name2 can't be blank")
      end
      it '苗字がカタカナ半角では登録できない' do
        @user.first_name2 = 'ｱｲｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name2 is invalid')
      end

      it '名前が空白では登録できない' do
        @user.last_name2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name2 can't be blank")
      end
      it '名前がカタカナ半角では登録できない' do
        @user.last_name2 = 'ｱｲｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name2 is invalid')
      end

      it '生年月日が--では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
