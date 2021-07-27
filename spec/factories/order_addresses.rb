FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567'}
    prefecture_id { 2 }
    city { '横浜市緑区' }
    address { '青山1-1-1' }
    building_name { '柳ビル103' }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    phone_number { '09012345678' }
  end
end