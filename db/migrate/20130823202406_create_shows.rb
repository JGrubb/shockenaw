class CreateShows < ActiveRecord::Migration[4.2]
  def change
    create_table :shows do |t|
      t.date :date
      t.string :venue
      t.string :location
      t.text :info
      t.string :link

      t.timestamps
    end
  end
end
