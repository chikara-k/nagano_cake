class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    # 商品合計の計算方法
    @item_total = 0
    @order.order_items.each do |order_item|
      @item_total += order_item.purchased_price * order_item.count
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(status_params)
      flash[:success] = "注文ステータスを変更しました"
      redirect_to admins_order_path(@order)
    else
      render :show
    end
  end

  private
  def status_params
    params.require(:order).permit(:status)
  end
end
