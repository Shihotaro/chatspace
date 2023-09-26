require 'rails_helper'

RSpec.describe 'Admin Dashboard', type: :system do
  let(:admin) { create(:user, :admin) }

  before do
    login admin
    visit admin_dashboard_path
  end

  it '管理人がログイン後、管理人ダッシュボードを表示すること' do
    expect(page).to have_content '管理者ダッシュボード'
  end

  it 'トップバーに管理人ページボタンを表示すること' do
    expect(page).to have_selector '.top-bar', text: '管理人ページ'
  end
end
