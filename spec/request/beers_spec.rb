require 'rails_helper'

RSpec.describe Api::V1::BeersController,  :type => :controller do
  let(:hash_keys) { ['identifier', 'name', 'description'] }
  let(:json) {JSON.parse(response.body) }

  describe 'GET/index' do

    it 'test http status' do
      get :index, params: { use_route: '/api/v1/beers/'}
      expect(response.status).to eql(200)
    end

    it 'test exact keys of response object index action' do
      get :index, params: { use_route: '/api/v1/beers/' }
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

    it 'test exact keys of response object for show action' do
      get :show, params: { user_route: '/api/v1/beers/', id: 1}
      json.each do |hash|
        expect(hash.keys).to contain_exactly(*hash_keys)
      end
    end

    it 'confirm that the number of obeject is equal to one' do
      get :show, params: {use_route: '/api/v1/beers/',  id: 1}
      expect(json.count).to eq 1
    end
  end
end
