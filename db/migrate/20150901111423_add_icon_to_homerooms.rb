class AddIconToHomerooms < ActiveRecord::Migration
  def change
    add_column :homerooms, :icon, :string
  end
end
