class ItemsController < ApplicationController
  def index
    @items = Items.includes(:user)
  end
  
end
