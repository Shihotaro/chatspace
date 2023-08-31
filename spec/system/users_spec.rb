require 'rails_helper'

RSpec.describe 'Users', type: :system do
  it '会員登録が完了した後、ログイン画面に遷移すること' do
    visit login_path
    click_on '会員登録'

    expect(page).to have_content 'パスワード確認用'
    fill_in 'user[name]', with: 'sample'
    fill_in 'user[email]', with: 'foo@example.com'
    fill_in 'user[password]', with: 'sample-password'
    fill_in 'user[password_confirmation]', with: 'sample-password'
    click_on '登録'

    expect(page).to have_content '登録しました'
    expect(page).to have_content 'ログイン'
  end
end
