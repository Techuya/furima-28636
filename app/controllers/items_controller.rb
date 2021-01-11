class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path 
    else
       render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :product_condition_id, :postage_payer_id, :prefecture_id, :arrival_day_id, :price, :user, :image)
  end

end
