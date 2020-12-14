class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :user_id
      t.integer :quantity
      t.string :g

      t.timestamps
    end
    add_index :orders, [:product_id, :user_id]
  end
end
