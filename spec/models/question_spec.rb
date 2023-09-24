require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'バリデーション' do
    let(:user) { create(:user) }
    let(:question) { create(:question, user: user) }

    it '有効な値でバリデーションが通ること' do
      expect(question).to be_valid
    end

    it 'タイトルがnilの場合、バリデーションが通らないこと' do
      question.title = nil
      expect(question).to_not be_valid
    end

    it '名前がnilの場合、バリデーションが通らないこと' do
      question.name = nil
      expect(question).to_not be_valid
    end

    it 'コンテンツがnilの場合、バリデーションが通らないこと' do
      question.content = nil
      expect(question).to_not be_valid
    end

    it 'コンテンツが4文字の場合、バリデーションが通らないこと' do
      question.content = 'mini'
      expect(question).to_not be_valid
    end

    it 'タイトルが30文字を超えた場合、バリデーションが通らないこと' do
      question.title = 'A' * 31
      expect(question).to_not be_valid
    end
  end
end
