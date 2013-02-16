class AssociateItemWithCategoryModel < ActiveRecord::Migration
  def change
    change_table :items do |i|
        i.remove :category
        i.integer :category_id
    end
  end
end
