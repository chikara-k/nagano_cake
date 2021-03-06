class Address < ApplicationRecord
  belongs_to :customer

# バリデーション
  validates :postal_code,     presence: true
  validates :address,         presence: true
  validates :name,            presence: true

  def resistration
  		"〒" + self.postal_code + "　" + self.address + "　" + self.name
  end
end
