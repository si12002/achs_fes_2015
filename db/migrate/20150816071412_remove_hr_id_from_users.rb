class RemoveHrIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :hr_id, :integer
  end
end
