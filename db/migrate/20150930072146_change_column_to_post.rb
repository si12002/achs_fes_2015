class ChangeColumnToPost < ActiveRecord::Migration
  def change
    change_column_default :posts, :point, 0.0
  end
end
