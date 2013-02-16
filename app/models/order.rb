class Order < ActiveRecord::Base
  attr_accessible :instructions, :pickup_time, :status, :total_price, :user_id

  has_many :items, through: :item_order
  belongs_to :user

  validates_presence_of :status, :total_price, :user_id
end
