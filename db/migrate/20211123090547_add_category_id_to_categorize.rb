class AddCategoryIdToCategorize < ActiveRecord::Migration[6.1]
  def change
    add_column :categorizes, :category_id, :integer
  end
end
