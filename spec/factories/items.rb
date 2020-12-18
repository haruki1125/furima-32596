FactoryBot.define do
  factory :item do
    item_name { 'aa' }
    item_info { 'aa' }
    item_category_id { 2 }
    item_condition_id { 2 }
    item_fee_status_id { 2 }
    item_prefecture_id { 2 }
    item_scheduled_id { 2 }
    item_price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
