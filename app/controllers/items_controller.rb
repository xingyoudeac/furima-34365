class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @item = Item.includes(:user)
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

  private

  def item_params
    params.require(:item).permit(:image, :title, :concept, :category_id, :condition_id, :burden_id, :prefecture_id, :day_id, :day_id, :price).merge(user_id: current_user.id)
  end
  
end
