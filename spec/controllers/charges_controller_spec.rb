require 'rails_helper'
require 'stripe_mock'


RSpec.describe ChargesController, type: :controller do
  describe 'things charges do' do

    let(:stripe_helper) {StripeMock.create_test_helper}
    before {StripeMock.start}
    after {StripeMock.stop}

    it 'charges things' do
      customer = Stripe::Customer.create(
          {
              email: 'johnny@appleseed.com',
              card: stripe_helper.generate_card_token
          })
      expect(customer.email).to eq('johnny@appleseed.com')
    end

    it 'doesn\'t create shock_customers if the card is declined' do
      StripeMock.prepare_card_error :card_declined
      expect(Customer.count).to eq 0
      expect(Order.count).to eq 0
    end

  end
end
