require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録が出来る時' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
        # トップページに移動する
        visit root_path
        # トップページにサインアップページへ遷移するボタンがあることを確認する
        expect(page).to have_content('新規登録')
        # トップページにログインページへ遷移するボタンがあることを確認する
        expect(page).to have_content('ログイン')
        # 新規登録ページへ移動する
        visit new_user_registration_path
        # ユーザー情報を入力する
        fill_in 'Nickname', with: @user.nickname
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        fill_in 'Password confirmation', with: @user.password_confirmation
        # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
        expect{
          find('button "新規登録" ').click
        }.to change { User.count }.by(1)
        # トップページへ遷移したことを確認する
        expect(current_path).to eq(root_path)
        # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
        expect(page).to have_no_content('新規登録')
        expect(page).to have_no_content('ログイン')
  end
end
  context 'ユーザー新規登録ができないとき' do
    end
  end
