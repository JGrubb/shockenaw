class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_create :populate_price

  private

  def populate_price
    self.price = self.product.price
  end

end
