FactoryBot.define do
  factory :vender do
    title { Faker::Lorem.sentence }
    residence { '東京都港区' }
    genre_id { 3 }
    introduction { '' }
    association :user

    after(:build) do |vender|
      vender.image.attach(io: File.open('public/images/image7.jpeg'), filename: 'image7.jpeg')
    end
  end
end
