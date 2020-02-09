class RemoveForumeImageIdFromForums < ActiveRecord::Migration[5.2]
  def change
    remove_column :forums, :forum_image_id, :string
  end
end
