class CreateOrders < ActiveRecord::Migration
  def change

    enable_extension 'uuid-ossp'

    create_table :orders, id: :uuid do |t|
      t.references :customer, index: true
      t.integer :total

      t.timestamps
    end
  end
end
