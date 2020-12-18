require 'rails_helper'

describe AddressDonation do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)#itemのfactorybot作って@addressに入れる
    @address = FactoryBot.build(:address_donation, user_id: user.id, item_id: item.id)
    sleep(1)
  end
  describe '購入情報の保存' do
    context '購入情報の保存とトークンがうまくいくとき' do
      it '必要なカラムが存在すれば保存できる' do
        expect(@address).to be_valid
      end
      it "buildingが空でも登録できる" do
        @address.building = nil
        expect(@address).to be_valid
      end
    end
    context '購入情報の保存がうまくいかない' do
      it "tokenが空では登録できないこと" do
        @address.token = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @address.postal_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'item_prefecture_idを選択していないと保存できないこと' do
        @address.item_prefecture_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include("Item prefecture must be other than 1")
      end
      it 'cityが空だと保存できないこと' do
        @address.city = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと保存できないこと' do
        @address.addresses = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberがハイフンありだと保存できないこと' do
        @address.phone_number = 190-0000-1111
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @address.phone_number = 123456789123
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが空だと保存できないこと' do
        @address.user_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @address.item_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
