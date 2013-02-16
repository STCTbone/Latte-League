class Item < ActiveRecord::Base
  attr_accessible :category_id, :city, :country, :is_available, :name, :price

  has_many :orders
  belongs_to :category

  validates_presence_of :category_id, :is_available, :name, :price
  validates_uniqueness_of :name

  def price=(price)
    write_attribute(:price, price.to_f * 100)
  end

  def price
    price = price_in_cents/100.to_f
    ("%0.2f" % [price])
  end

  def price_in_cents
    read_attribute(:price)
  end
end
