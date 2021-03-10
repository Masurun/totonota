require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'ユーザー新規登録 ' do
      context 'ユーザー新規登録が正常に挙動しない時' do
        it 'nicknameが空では保存できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では保存できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'emailは「@」がないと保存できない' do
          @user.email = 'test.test.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'すでに保存されているemailは保存できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
       
        it 'passwordが空では保存できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank",
                                                        'Password is invalid',
                                                        'Password is too short (minimum is 6 characters)',
                                                        "Password confirmation doesn't match Password")
        end
        it 'passwordが半角英数字混合でなければ保存できない' do
          @user.password = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it 'passwordは英字のみでは登録できないこと' do
          @user.password = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it 'passwordが6文字以上でなければ保存できない' do
          @user.password = 'a11'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'password_confimationが空では保存できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'my_saunaが30文字以上では保存できない' do
          @user.my_sauna = 'a' * 31
          @user.valid?
          expect(@user.errors.full_messages).to include("My sauna is too long (maximum is 30 characters)")
        end
      end
      context 'ユーザー新規登録が正常に挙動する時' do
        it 'すべての情報が登録できること' do
          expect(@user).to be_valid
        end
      end
    end
  end
  