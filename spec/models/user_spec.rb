require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'Example User', email: 'user@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(email: 'user@example.com', password: 'password')
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user = User.new(name: 'Example User', password: 'password')
    expect(user).to_not be_valid
  end

  it 'is not valid with a duplicate email' do
    User.create(name: 'Existing User', email: 'user@example.com', password: 'password')
    user = User.new(name: 'Duplicate User', email: 'user@example.com', password: 'password')
    expect(user).to_not be_valid
  end

  it 'is not valid with too long name' do
    user = User.new(name: 'a' * 21, email: 'user@example.com', password: 'password')
    expect(user).to_not be_valid
  end

  it 'is not valid with too long email' do
    user = User.new(name: 'Example User', email: "#{'a' * 51}@example.com", password: 'password')
    expect(user).to_not be_valid
  end
end
