class RemoveUserIdFromComments < ActiveRecord::Migration[6.1]
  def change
  	# remove_index :comments,:user, name: "index_comments_on_user"
  	# rename_column :comments,:user,:user_id
  end
end
