require 'rails_helper'

RSpec.describe Api::V1::BeersController,  :type => :controller do
  describe 'GET/index' do
    it 'test http status' do
      get :index, params: { use_route: '/api/v1/beers/'}
      expect(response.status).to eql(200)
    end
  end
end
