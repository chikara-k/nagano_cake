class Admins::ItemsController < ApplicationController
      def new
        @item = Item.new
      end
    
      def index
        @items = Item.all.page(params[:page]).per(4)
      end
    
      def create
        @item = Item.new(item_params)
        if @item.save
          flash[:success] = "新商品を登録しました"
          redirect_to admins_items_path
        else
          render :new
        end
      end
    
      def show
        @item = Item.find(params[:id])
      end
    
      def edit
        @item = Item.find(params[:id])
      end
    
      def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
          flash[:success] = "商品内容をを変更しました"
          redirect_to admins_item_path(@item)
        else
          render :edit
        end
      end
    
      private
      def item_params
        params.require(:item).permit(:name, :detail, :genre_id, :is_sold, :price)
      end
end
