class AddspotaddressToPosts < ActiveRecord::Migration[5.2]
  def change
  	add_column :posts, :spot, :string
  end
end
