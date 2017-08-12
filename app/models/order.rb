class Order < ActiveRecord::Base
  include AASM

  aasm do
    state :new, initial: true
    state :declined, :complete

    event :card_declined do
      transitions from: :new, to: :declined
    end

    event :card_charged do
      transitions from: :new, to: :complete
    end

  end

  belongs_to :customer
  has_many :line_items
end
