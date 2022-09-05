require 'rest-client'

class Api::V1::BeersController < ApplicationController

  def index
    result = make_beer_request
    beers = form_json_object(result)
    render json: beers
  end

  private

  def make_beer_request
    url = 'https://api.punkapi.com/v2/beers'
    response = RestClient.get(url)
    JSON.parse(response)
  end

  def form_json_object(result)
    arr = []
    myhash = {}
    result.each do |beer|
      arr << myhash = { 'identifier' => beer['id'], 'name' => beer['name'], 'description' => beer['description'] }
    end
    arr
  end

end
