require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'バリデーション' do
    let(:user) { create(:user) }
    let(:question) { create(:question, user: user) }
    let(:favorite) { create(:favorite, user: user, question: question) }

    it '有効な値でお気に入りが作成されること' do
      expect(favorite).to be_valid
    end
  end
end
