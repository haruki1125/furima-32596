FactoryBot.define do
  factory :address_donation do
    postal_code { '123-4567' }
    item_prefecture_id { 2 }
    city { '東京都' }
    addresses { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09011112222' }
    association :purchase
    user_id { 2 }
    item_id { 1 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
