class ItemOrder < ActiveRecord::Base
  attr_accessible :item_id, :order_id

  belongs_to :item
  belongs_to :order
end
