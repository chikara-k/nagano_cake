class OrderDetail < ApplicationRecord
    belongs_to :order, optional: true
    belongs_to :item, dependent: :destory, optional: true
end
