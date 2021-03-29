class Order < ApplicationRecord
    belongs_to :customer
	has_many :order_details, dependent: :destroy
	
# 	accepts_nested_attributes_for :ordered_products

	validates :postal_code,        presence: true
	validates :address,            presence: true
	validates :name,               presence: true
	validates :payment_method,     presence: true
	enum payment_method: {creditcard: 0, bank: 1}
# 	enumで管理, {0: 入金待ち, 1: 入金確認, 2:製作中, 3:発送準備中, 4:発送済み}
# 	enum status: {}

  def subtotal
	(product.price*stock*1.1).round
  end
end
