class AddPostIdInImages < ActiveRecord::Migration[6.1]
  def change
  	add_column :images,:post_id,:integer
  end
end
