require 'rails_helper'

RSpec.describe 'Questions', type: :system do
  it '質問の新規投稿が完了した後、質問詳細画面に遷移すること' do
    visit questions_path
    click_on '新規投稿する'

    expect(page).to have_content '質問の新規作成'
    fill_in 'question[title]', with: 'sample'
    fill_in 'question[name]', with: 'sample_user'
    fill_in 'question[content]', with: 'test text'
    click_on '投稿'

    expect(page).to have_content 'コメントする'
  end
end
