class AddIndexOnShowDate < ActiveRecord::Migration
  def change
    add_index :shows, :date
  end
end
