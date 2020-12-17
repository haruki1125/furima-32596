class AddressesController < ApplicationController

  def index
    @address = AddressDonation.new
    @item = Item.find(params[:item_id])
  end
  def create
    @item = Item.find(params[:item_id])
    @address = AddressDonation.new(address_params)
    if @address.valid?
      pay_item
      @address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.require(:address_donation).permit(:postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id:params[:item_id], token: params[:token]) 
  end

  def pay_item
    Payjp.api_key = "sk_test_8af1dae53af23df7801f587b"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.item_price,  # 商品の値段
      card: address_params[:token],    # カードトークン ストロングパラメーターにtokenの情報も入れてあげる必要あり
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end


