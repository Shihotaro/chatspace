FactoryBot.define do
  factory :user do
    name { 'Sample User' }
    email { 'user@sample.com' }
    password { 'password' }
  end
end
