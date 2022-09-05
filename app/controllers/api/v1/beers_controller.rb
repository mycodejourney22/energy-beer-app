class Api::V1::BeersController < ApplicationController

  def index
    beers = [{'identifier' => 1, 'name' => 'Lager', 'description' => 'best beer ever' }]
    render json: beers
  end
end
