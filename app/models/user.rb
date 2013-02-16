class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :is_vendor, :last_name, :mobile, :password

  has_many :orders, through: :item_order

  validates_presence_of :email, :first_name, :last_name, :password

  validates_uniqueness_of :email
end
