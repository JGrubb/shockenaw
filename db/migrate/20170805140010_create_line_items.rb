class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.references :product, foreign_key: true
      t.integer :price
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
