class RenameClassColumnToHomerooms < ActiveRecord::Migration
  def change
  	rename_column :homerooms, :class, :class_no
  end
end
