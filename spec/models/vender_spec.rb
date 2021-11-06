require 'rails_helper'

RSpec.describe Vender, type: :model do
  before do
    @vender = FactoryBot.build(:vender)
  end
  describe '新規投稿' do
    context '新規投稿出来ない時' do
      it 'titleが空では登録出来ない' do
        @vender.title = ""
        @vender.valid?
        expect(@vender.errors.full_messages)
      end
      it 'genre_idが1では登録出来ない' do
        @vender.genre_id = 1
        @vender.valid?
        expect(@vender.errors.full_messages)
      end
      it 'residenceが空では登録出来ない' do
        @vender.residence = ''
        @vender.valid?
        expect(@vender.errors.full_messages)
      end
      it 'imageが空では登録出来ない' do
        @vender.image = nil
        @vender.valid?
        expect(@vender.errors.full_messages)
      end
      it 'ユーザー情報がないと投稿出来ない' do
        @vender.user = nil
        @vender.valid?
        expect(@vender.errors.full_messages)
      end
    end

    context '新規投稿出来る時' do
      it '全て入力されている時投稿できる' do
        expect(@vender).to be_valid
      end
      it 'introductionが空でも投稿出来る' do
        @vender.introduction = ''
        @vender.valid?
        expect(@vender.errors.full_messages)
      end
    end
  end
end
