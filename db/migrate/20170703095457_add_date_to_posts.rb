class AddDateToPosts < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :thedate, :date
  	add_index :posts, [:user_id, :title, :thedate], unique: true
  end
end
