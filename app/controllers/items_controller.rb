class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :product_condition_id, :postage_payer_id, :prefecture_id, :arrival_day_id, :price, :user, :image)
  end

end
