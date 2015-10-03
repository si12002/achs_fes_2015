class AddCategoryToHomerooms < ActiveRecord::Migration
  def change
    add_column :homerooms, :category, :integer
  end
end
