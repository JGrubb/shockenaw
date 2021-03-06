class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.integer :price
      t.uuid :sku
      t.text :description

      t.timestamps
    end
  end
end
