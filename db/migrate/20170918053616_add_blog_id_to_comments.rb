class AddBlogIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :blog_id, :integer
  end
end
