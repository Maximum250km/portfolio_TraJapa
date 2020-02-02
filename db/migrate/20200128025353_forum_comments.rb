class ForumComments < ActiveRecord::Migration[5.2]
  def change
  	drop_table :forum_comments
  end
end
