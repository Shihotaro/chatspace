require 'rails_helper'

RSpec.describe 'Questions', type: :system do
  let(:user) { create(:user) }

  it '質問の新規投稿が完了した後、質問詳細画面に遷移すること' do
    # ログイン画面からログイン
    login(user)

    # マイページからQ&A画面に遷移
    expect(page).to have_content 'さんのマイページ'
    click_on 'Q&A'

    expect(page).to have_content '投稿広場'
    click_on '新規投稿する'

    fill_in 'question[title]', with: 'sample'
    fill_in 'question[name]', with: 'sample_user'
    fill_in 'question[content]', with: 'test text'
    click_on '投稿'

    expect(page).to have_content 'コメントする'
    expect(page).to have_content 'sample'
    expect(page).to have_content 'sample_user'
    expect(page).to have_content 'test text'
  end
end
