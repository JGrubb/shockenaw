class Order < ActiveRecord::Base

  has_many :line_items
  has_many :products, through: :line_items
  belongs_to :customer

  before_create :populate_uuid

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

  def total
    self.line_items.sum :price
  end

  def dl_url
    signer = Aws::S3::Presigner.new
    signer.presigned_url(:get_object, bucket:'shockenaw-downloads', key: self.products.first.file_url)
  end

  private

  def populate_uuid
    self.uuid = SecureRandom.uuid
  end

end
