class AddFirstFewProducts < ActiveRecord::Migration[5.0]
  require 'securerandom'
  def up
    if Product.count == 0
      mp3 = Product.create({
                               title: "Food Locker mp3",
                               description: "Food Locker mp3",
                               price: 399,
                               sku: SecureRandom.uuid
                           })
      flac = Product.create({
                                title: "Food Locker FLAC",
                                description: "Food Locker FLAC",
                                price: 599,
                                sku: SecureRandom.uuid
                            })
    end
  end

  def down
    if Product.count == 2
      Product.delete_all
    end
  end
end
