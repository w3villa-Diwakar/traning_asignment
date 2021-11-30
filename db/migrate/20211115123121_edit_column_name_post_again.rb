class EditColumnNamePostAgain < ActiveRecord::Migration[6.1]
  def change
  	rename_column :posts,:desciption,:description
  end
end
