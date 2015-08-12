class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_token
      t.int :role_id
      t.string :hr_id

      t.timestamps
    end
  end
end
