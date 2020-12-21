class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:destroy, :show, :update, :edit]
  before_action :buy_item, only: [:edit, :destroy]
  def index
    @items = Item.all.order('created_at DESC')
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
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if current_user.id == @item.user_id && @item.update(item_params)
      @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_condition_id, :item_fee_status_id, :item_prefecture_id, :item_scheduled_id, :item_price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def buy_item
    if @item.purchase != nil
      redirect_to root_path
    end
  end
end
