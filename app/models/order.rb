class Order < ActiveRecord::Base
  attr_accessible :instructions, :pickup_time, :status, :total_price, :user_id

  has_many :item_orders, dependent: :destroy
  has_many :items, through: :item_orders, dependent: :destroy

  belongs_to :user

  validates_presence_of :status, :total_price, :user_id

  def total
       sum = 0
       self.items.each do |item|
        sum += item.price
       end
       return sum
  end
end
