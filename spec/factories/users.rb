FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { 'aaa1111' }
    password_confirmation { password }
    nickname              { 'aa' }
    last_name             { 'ああ' }
    first_name            { 'ああ' }
    last_name_kana        { 'アア' }
    first_name_kana       { 'アア' }
    birthday              { '1990-12-01' }
  end
end
