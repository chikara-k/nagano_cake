class CartItem < ApplicationRecord
    
 belongs_to :customer
	belongs_to :item
	validates :amount, numericality: { only_integer: true,	greater_than: 0, less_than: 10}


	#商品の税込み単価
     def tax_included
      (item.price*1.1).round
     end

    #小計
     def subtotal
      (item.price*stock*1.1).round
     end
    
	 def total_amount
	  (item.amount).sum
	 end
end
