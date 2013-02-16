class Item < ActiveRecord::Base
  attr_accessible :category, :city, :country, :is_available, :name, :price
end
