FactoryBot.define do
  factory :user do
    name { 'Sample User' }
    email { 'user@sample.com' }
    password { 'password' }
  end

  trait :admin do
    admin { true }
  end
end
