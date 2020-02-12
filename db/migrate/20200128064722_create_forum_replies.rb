class CreateForumReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :forum_replies do |t|
      t.integer :user_id
      t.integer :forum_id
      t.text :comments

      t.timestamps
    end
  end
end
