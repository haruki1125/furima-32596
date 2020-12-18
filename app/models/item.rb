class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :item_fee_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled

  has_one_attached :image
  belongs_to :user
  has_one :purchase

  with_options numericality: { other_than: 1 } do
    validates :item_category_id
    validates :item_condition_id
    validates :item_fee_status_id
    validates :item_prefecture_id
    validates :item_scheduled_id
  end

  validates :item_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300円から9999999円以内にしてください' }

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
    validates :item_price
  end

  validates :item_info, length: { maximum: 1000 }
  validates :item_name, length: { maximum: 40 }
end