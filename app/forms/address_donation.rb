class AddressDonation

  include ActiveModel::Model
  attr_accessor :postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number, :purchase, :item_id, :user_id, :token

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city 
    validates :addresses
    validates :phone_number, format: { with: VALID_PHONE_REGEX }
    validates :token
  end

  
  
  validates :item_prefecture_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    #購入履歴を保存
    Address.create(postal_code: postal_code, item_prefecture_id: item_prefecture_id, city: city, addresses: addresses, building: building,phone_number: phone_number, purchase_id: purchase.id )
    #アドレスと購入履歴のidを保存
  end

end
