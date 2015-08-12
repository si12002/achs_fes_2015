class CreateHomerooms < ActiveRecord::Migration
  def change
    create_table :homerooms do |t|
      t.string :shop_name
      t.text :content
      t.text :menu

      t.timestamps
    end
  end
end
