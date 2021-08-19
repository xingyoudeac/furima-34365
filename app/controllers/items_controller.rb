class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show]
  
  def index
    @item = Item.all.order('created_at DESC')
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

  def edit
  end

  def show
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :concept, :category_id, :condition_id, :burden_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end
  
end
