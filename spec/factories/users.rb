FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password }
    password_confirmation { password }
    nickname              { Faker::Name.initials }
    last_name             { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    last_name_kana        { Gimei.last.katakana }
    first_name_kana       { Gimei.first.katakana }
    birthday              { Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today) }
    
  end
end
