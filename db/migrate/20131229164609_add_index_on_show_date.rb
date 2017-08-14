class AddIndexOnShowDate < ActiveRecord::Migration[4.2]
  def change
    add_index :shows, :date
  end
end
