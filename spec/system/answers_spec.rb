require 'rails_helper'

RSpec.describe 'Answers', type: :system do
  let(:user) { create(:user) }
  let(:question) { create(:question, user: user) }

  it '回答完了後、質問詳細画面に回答が表示されること' do
    visit question_path(id: question.id)

    expect(page).to have_content question.title

    fill_in 'answer[name]', with: 'answer man'
    fill_in 'answer[content]', with: 'sample answer'
    click_on '投稿'

    expect(page).to have_content 'answer man'
    expect(page).to have_content 'sample answer'
  end
end
