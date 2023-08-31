require 'rails_helper'

RSpec.describe 'Records', type: :system do
  let(:valid_data) { { name: 'Sample User', email: 'user@sample.com', password: 'password' } }
  let(:user) { User.create(valid_data) }

  it '新規投稿が完了した後、一覧画面に遷移すること' do
    # ログイン画面からログイン
    visit login_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'ログイン'

    # record一覧画面からrecordの新規登録
    expect(current_path).to eq(records_path)
    click_on '記録作成'

    fill_in 'record[date]', with: '2023-08-30'
    fill_in 'record[body_temperature]', with: 36
    fill_in 'record[weight]', with: 45
    fill_in 'record[body_fat_percentage]', with: 15
    select '良い', from: 'record[condition]'
    fill_in 'record[memo]', with: 'sample text'
    click_on '登録'

    expect(current_path).to eq(records_path)
    expect(page).to have_content '2023-08-30'
  end
end
