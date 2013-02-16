class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.float :price
      t.string :name
      t.string :country
      t.string :city
      t.string :category
      t.boolean :is_available

      t.timestamps
    end
  end
end
