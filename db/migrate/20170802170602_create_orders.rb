class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :uuid, limit: 36
      t.references :customer_id, index: true
      t.integer :order_total

      t.timestamps
    end
  end
end
