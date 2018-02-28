class CreateOrders < ActiveRecord::Migration[5.0]
  def change

    enable_extension 'uuid-ossp'

    create_table :orders do |t|
      t.references :customer, index: true
      t.integer :total
      t.uuid :uuid, index: true

      t.timestamps
    end
  end
end
