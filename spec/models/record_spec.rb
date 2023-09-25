require 'rails_helper'

RSpec.describe Record, type: :mode do
  describe 'バリデーション' do
    let(:user) { create(:user) }
    let(:sample_record) { { date: '2023-08-30', body_temperature: 36, weight: 45, body_fat_percentage: 15, condition: 2, memo: 'sample text', user_id: user.id } }
    let(:record) { Record.new(sample_record) }

    context '有効な入力内容の場合' do
      it 'バリデーションが通ること' do
        expect(record).to be_valid
      end
    end

    context '入力内容に不備がある場合' do
      it '日付がnilの場合、バリデーションが通らないこと' do
        record.date = nil
        expect(record).to_not be_valid
      end

      it '体温がnilの場合、バリデーションが通らないこと' do
        record.body_temperature = nil
        expect(record).to_not be_valid
      end

      it '体重がnilの場合、バリデーションが通らないこと' do
        record.weight = nil
        expect(record).to_not be_valid
      end

      it '体脂肪率がnilの場合、バリデーションが通らないこと' do
        record.body_fat_percentage = nil
        expect(record).to_not be_valid
      end

      it '体調がnilの場合、バリデーションが通らないこと' do
        record.condition = nil
        expect(record).to_not be_valid
      end

      it 'コンテンツがnilの場合、バリデーションが通らないこと' do
        record.body_fat_percentage = nil
        expect(record).to_not be_valid
      end

      it 'メモがnilの場合、バリデーションが通らないこと' do
        record.memo = nil
        expect(record).to_not be_valid
      end

      it 'ユーザーIDがnilの場合、バリデーションが通らないこと' do
        record.user_id = nil
        expect(record).to_not be_valid
      end
    end
  end
end
