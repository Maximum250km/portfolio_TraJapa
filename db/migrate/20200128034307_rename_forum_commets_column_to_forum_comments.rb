class RenameForumCommetsColumnToForumComments < ActiveRecord::Migration[5.2]
  def change
  	 rename_column :forum_comments, :forum_comments, :reply
  end
end
