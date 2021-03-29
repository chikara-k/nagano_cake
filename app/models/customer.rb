class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :cart_items, dependent: :destroy
  has_many :address, dependent: :destroy
  has_many :orders, dependent: :destroy
         
  validates :first_name,        presence: true
  validates :last_name,         presence: true
  validates :first_name_kana,   presence: true
  validates :last_name_kana,    presence: true
  validates :email,             presence: true
  validates :postal_code,       presence: true
  validates :address,           presence: true
  validates :telephone_number,  presence: true
  validates :is_active,         presence: true


  def full_address
    postal_code + address + first_name + last_name
  end

  def name
    [first_name,last_name].join(' ')
  end

  def kana
    [first_kana,last_kana].join(' ')
  end
end
