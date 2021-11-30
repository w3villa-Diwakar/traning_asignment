class CreateCategorizes < ActiveRecord::Migration[6.1]
  def change
    create_table :categorizes do |t|
      t.integer :categorizable_id
      t.string :categorizable_type

      t.timestamps
    end
  end
end
