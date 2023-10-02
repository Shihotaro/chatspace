require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it '有効な値でバリデーションが通ること' do
    expect(user).to be_valid
  end

  it '名前がない場合、バリデーションが通らないこと' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'メールアドレスがない場合、バリデーションが通らないこと' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it '同じメールアドレスがある場合、バリデーションが通らないこと' do
    user.save
    duplicate_user = User.new(name: 'Duplicate User', email: 'user@sample.com', password: 'password')
    expect(duplicate_user).to_not be_valid
  end

  it '名前が21文字以上の場合、バリデーションが通らないこと' do
    user.name = 'a' * 21
    expect(user).to_not be_valid
  end

  it '有効ではない形式のメールアドレスの場合、バリデーションが通らないこと' do
    user.email = 'invalid_email'
    expect(user).to_not be_valid
  end
end
