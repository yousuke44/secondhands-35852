FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    price { 100 }
    year_period_id { 2 }
    lecture { 'テスト講義' }
    teacher { 'テスト太郎' }
    sales_status_id { 2 }
    scheduled_delivery_id { 2 }
    author { 'テスト著者' }
    publisher { 'テスト出版社' }
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end