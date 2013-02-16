class Order < ActiveRecord::Base
  attr_accessible :instructions, :pickup_time, :status, :total_price, :user_id
end
