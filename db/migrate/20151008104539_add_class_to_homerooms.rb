class AddClassToHomerooms < ActiveRecord::Migration
  def change
    add_column :homerooms, :class, :integer
  end
end
