class AddCContentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :c_content, :string
  end
end
