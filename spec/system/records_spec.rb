require 'rails_helper'

RSpec.describe 'Records', type: :system do
  let(:user) { create(:user) }

  it '新規投稿が完了した後、一覧画面に遷移すること' do
    login(user)

    click_on '体調管理'

    expect(current_path).to eq(records_path)
    click_on '記入する'

    fill_in 'record[date]', with: '2023-09-01'
    fill_in 'record[body_temperature]', with: 36
    fill_in 'record[weight]', with: 45
    fill_in 'record[body_fat_percentage]', with: 15
    select '良い', from: 'record[condition]'
    fill_in 'record[memo]', with: 'sample text'
    click_on '登録'

    expect(current_path).to eq(records_path)
    expect(page).to have_content '2023-09-01'
  end
end
