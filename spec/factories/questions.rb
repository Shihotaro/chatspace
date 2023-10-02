FactoryBot.define do
  factory :question do
    title { 'Sample Title' }
    name { 'Sample Name' }
    content { 'Sample Content' }
    association :user
  end
end
