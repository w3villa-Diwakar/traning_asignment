class AddSlugToImages < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :slug, :string
  end
end
