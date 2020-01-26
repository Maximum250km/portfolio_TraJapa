class CreateForums < ActiveRecord::Migration[5.2]
  def change
    create_table :forums do |t|
      t.string :forum_title
      t.text :forum_body
      t.string :forum_image_id
      t.integer :forum_genre

      t.timestamps
    end
  end
end
