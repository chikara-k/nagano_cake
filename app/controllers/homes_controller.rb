class HomesController < ApplicationController
  def top
    @item = Item.first(4)
    @tax = 1.1
  end
  
  def about
  end
end
