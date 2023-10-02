require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'バリデーション' do
    it '有効な値でバリデーションが通ること' do
      tag = build(:tag, name: 'SampleTag')
      expect(tag).to be_valid
    end

    it 'nameがない場合、バリデーションが通らないこと' do
      tag = build(:tag, name: nil)
      expect(tag).to_not be_valid
    end

    it 'nameの文字数が21以上の場合、バリデーションが通らないこと' do
      tag = build(:tag, name: 'a' * 21)
      expect(tag).to_not be_valid
    end
  end
end
