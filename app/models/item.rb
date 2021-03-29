class Item < ApplicationRecord
    belongs_to :genre
    has_many :cart_items
    has_many :order_details
    
    attachment :product_image
    
    validates :genre_id, presence: true
    validates :price, presence: true
    validates :introduction, presence: true
    validates :is_active, presence: true
    validates :name, presence: true

    def tax_included
    	(price*1.1).round
    end
end
