class AddForeignKey < ActiveRecord::Migration[6.1]
  def change
  	add_column :posts,:user_id,:integer
  	add_column :events,:user_id,:integer
  	add_column :images,:user_id,:integer

  end
end
