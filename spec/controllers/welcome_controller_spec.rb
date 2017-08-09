require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'the front page' do
    it 'loads' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
