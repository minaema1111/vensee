require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it 'emailが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123455'
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it 'passwordが英語のみでは登録できないこと' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it 'passwordが数字だけでは登録できない' do
      @user.password = 123456
      @user.password_confirmation = 123456
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it 'passwordが全角では登録できない' do
      @user.password = '１２３abc'
      @user.password_confirmation = '１２３abc'
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it 'emailは＠が無いと保存できないこと' do
      @user.email = 'email_pass'
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it '重複したemailが存在する場合登録できないこと' do
      FactoryBot.create(:user, email: 'test@mail.com')
      @user = FactoryBot.build(:user, email: 'test@mail.com')
      @user.valid?
      expect(@user.errors.full_messages)
    end
  end

    context '新規登録できるとき' do
      it '全て入力されている時登録できる' do
        expect(@user).to be_valid
      end
    end
    end
  end
