require 'rails_helper'

RSpec.describe 'Tag', type: :system do
  let(:user) { create(:user) }

  before do
    login(user)
  end

  describe 'タグ付け' do
    it '質問の作成時にタグを追加できること' do
      visit new_question_path

      fill_in 'question_title', with: 'Test Question'
      fill_in 'question_name', with: 'guest user'
      fill_in 'question_content', with: 'This is a test question.'
      fill_in 'tag_names', with: 'tag1,tag2'

      click_button '投稿'

      expect(page).to have_content '質問を作成しました'
      expect(page).to have_content 'tag1'
      expect(page).to have_content 'tag2'
    end
  end

  describe 'タグ検索' do
    let!(:question) { create(:question, user: user) }
    let!(:tag) { create(:tag, name: 'searchTag') }

    before do
      question.tags << tag
    end

    it 'タグで質問を検索できること' do
      visit questions_path

      fill_in 'tag_search', with: 'searchTag'
      find('.search-button').click

      expect(page).to have_content question.title
      expect(page).to have_content tag.name
    end
  end
end
