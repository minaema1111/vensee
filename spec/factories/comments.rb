FactoryBot.define do
  factory :comment do
    content     { 'これはテストです' }
    association :user
    association :vender
  end
end
