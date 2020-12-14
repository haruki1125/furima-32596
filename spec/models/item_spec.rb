require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品機能がうまくいくとき' do
      it 'image,item_name,item_info,item_category_id,item_condition_id,item_fee_status_id,item_prefecture_id,item_scheduled_id,item_priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品機能がうまくいかないとき' do
      it "画像が空だと登録不可なこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空だと登録不可なこと" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      
      it "商品の説明が空だと登録不可なこと" do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      
      it "カテゴリーが1ならば登録不可なこと" do
        @item.item_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category must be other than 1")
      end
      
      it "商品の状態が1なら登録不可なこと" do
        @item.item_condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition must be other than 1")
      end
      it "配送料の負担が1なら登録不可なこと" do
        @item.item_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item fee status must be other than 1")
      end
  
      it "発送元の地域が1なら登録不可なこと" do
        @item.item_prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture must be other than 1")
      end
  
      it "発送までの日数が1なら登録不可なこと" do
        @item.item_scheduled_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled must be other than 1")
      end

      it "値段がが空白なら登録不可なこと" do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it "値段が文字だと登録不可なこと" do
        @item.item_price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price は300円から9999999円以内にしてください")
      end
      it "値段が全角数字だと登録不可なこと" do
        @item.item_price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price は300円から9999999円以内にしてください")
      end

      it "値段が300よりも小さければ登録不可なこと" do
        @item.item_price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price は300円から9999999円以内にしてください")
      end
      it "値段が10,000,000ならば登録不可なこと" do
        @item.item_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price は300円から9999999円以内にしてください")
      end
    end
  end
end


