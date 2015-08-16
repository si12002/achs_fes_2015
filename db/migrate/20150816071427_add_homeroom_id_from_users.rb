class AddHomeroomIdFromUsers < ActiveRecord::Migration
  def change
    add_column :users, :homeroom_id, :integer
  end
end
