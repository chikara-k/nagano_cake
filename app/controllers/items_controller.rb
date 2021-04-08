class ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: true).page(params[:page]).per(4)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :is_active, :price, :image_id)
  end
end
