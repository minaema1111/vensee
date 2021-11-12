require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  describe 'コメント投稿' do
    context 'コメント投稿出来ない時' do
      it '文字数が51文字以上では投稿出来ない' do
        @comment.content = 'これはテストこれはテストこれはテストこれはテストこれはテストこれはテストこれはテストこれはテストこれはテストこれはテストこれはテストこれはテストこれはテストこれはテストこれはテストこれはテストこれはテスト'
        @comment.valid?
        expect(@comment.errors.full_messages)
      end
      it 'コメント入力欄が空では投稿出来ない' do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages)
      end
    end

    context 'コメント投稿出来る時' do
      it 'コメント入力が50文字以下で入力されている時' do
        expect(@comment).to be_valid
      end
    end
  end
end
