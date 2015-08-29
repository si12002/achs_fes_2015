class AddCouponToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :coupon, :integer
  end
end
