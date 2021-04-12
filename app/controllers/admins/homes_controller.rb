class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top 
		@orders = Order.all
		@data = @orders.where("created_at >= ?", Date.today).count
		if @data > 0
      @data = @data.to_s + "件"
		else 
			@data = "注文なし！"
		end
  end
end
