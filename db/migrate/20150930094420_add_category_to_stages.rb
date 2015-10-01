class AddCategoryToStages < ActiveRecord::Migration
  def change
    add_column :stages, :category, :integer
  end
end
