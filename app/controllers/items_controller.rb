class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to root_path
    else
      render :new
    end
    
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
    

  end 



  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_condition_id, :item_fee_status_id, :item_prefecture_id, :item_scheduled_id, :item_price, :image).merge(user_id: current_user.id)
  end
end
