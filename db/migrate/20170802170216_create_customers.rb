class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :email
      t.string :stripe_id, index: true
      t.timestamps
    end
    add_index :customers, :email, unique: true
  end
end
