require 'rails_helper'

RSpec.describe 'Login', type: :system do
  let(:user) { create(:user) }

  context '未ログインの場合' do
    it '[会員登録],[ログアウト]リンクを表示すること' do
      visit login_path
      expect(page).to have_link '会員登録'
      expect(page).to have_link 'ログイン'
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_on 'ログイン', class: 'login'

      expect(page).not_to have_link '会員登録'
      expect(page).not_to have_link 'ログイン'
    end

    it 'ブランドネームを押下後、質問一覧に遷移すること' do
      visit login_path
      click_on 'みんなの広場', class: 'brand-name'

      expect(current_path).to eq(questions_path)
    end
  end

  context 'ログイン後の場合' do
    it '[ログアウト]リンクを表示すること' do
      login(user)

      expect(page).to have_link 'ログアウト'
    end

    it 'ブランドネームを押下後、マイページに遷移すること' do
      login(user)

      expect(current_path).to eq(mypage_path)
      click_on 'みんなの広場', class: 'brand-name'

      expect(current_path).to eq(records_path)
    end
  end
end
