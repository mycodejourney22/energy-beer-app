require 'rails_helper'

RSpec.describe Api::V1::BeersController,  :type => :controller do
  describe 'GET/index' do

    it 'test http status' do
      get :index, params: { use_route: '/api/v1/beers/'}
      expect(response.status).to eql(200)
    end

    it 'test exact keys of response object' do
      get :index, params: { use_route: '/api/v1/beers/' }
      hash_keys = ['identifier', 'name', 'description']
      json = JSON.parse(response.body)
      json.each do |hash|
        expect(hash.keys).to contain_exactly(*hash_keys)
      end
    end
  end

  describe 'GET/show' do

    it 'test http status' do
      get :show, params: { user_route: '/api/v1/beers/', id: 1}
      expect(response.status).to eql(200)
    end
  end
end
