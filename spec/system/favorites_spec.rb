require 'rails_helper'

RSpec.describe 'Favorites', type: :system do
  let(:user) { create(:user) }
  let(:question) { create(:question, user: user) }

  describe 'お気に入り機能' do
    context 'ユーザーがログインしている場合' do
      before do
        login(user)
        visit question_path(question)
      end

      it 'お気に入り登録ができること' do
        find('.like-button').click
        expect(page).to have_content 'お気に入りに追加しました'
        expect(page).to have_selector('.non-like-button')
      end
    end

    context 'ユーザーが未ログインの場合' do
      before do
        visit question_path(question)
      end

      it 'お気に入り登録ができないこと' do
        find('.like-button').click
        expect(page).to have_content 'お気に入り機能にはログインが必要です'
      end
    end

    describe 'お気に入り登録の解除' do
      let!(:favorite) { create(:favorite, user: user, question: question) }

      context 'ユーザーがログインしている場合' do
        before do
          login(user)
          visit question_path(question)
        end

        it 'お気に入り登録を削除できること' do
          find('.non-like-button').click
          expect(page).to have_content 'お気に入りを削除しました'
          expect(page).to have_selector('.like-button')
        end
      end
    end
  end
end
