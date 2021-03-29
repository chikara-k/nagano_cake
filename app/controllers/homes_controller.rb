class HomesController < ApplicationController
  def top
    @item = Item.first(4)
    @tax = 1.08
  end
  
  def about
  end
end
