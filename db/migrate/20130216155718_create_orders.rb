class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.datetime :pickup_time
      t.float :total_price
      t.text :instructions
      t.string :status

      t.timestamps
    end
  end
end
