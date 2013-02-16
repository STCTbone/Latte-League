class Item < ActiveRecord::Base
  attr_accessible :category, :city, :country, :is_available, :name, :price

  has_many :orders

  validates_presence_of :category, :is_available, :name, :price
  validates_uniqueness_of :name
end
