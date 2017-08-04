class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email, index: true
      t.string :stripe_id, index: true
      t.timestamps
    end
    add_index :customers, :email, unique: true
  end
end
