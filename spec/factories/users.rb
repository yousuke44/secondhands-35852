FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation { password }
    university_id { 2 }
    department_id { 2 }
    birthday { '1989-07-23' }
  end
end