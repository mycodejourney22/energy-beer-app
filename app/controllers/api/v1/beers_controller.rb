require 'rest-client'

class Api::V1::BeersController < ApplicationController

  def index
    params[:query].present? ? url = build_url_with_params(params[:query]) : url = build_url
    result = make_beer_request(url)
    beers = form_json_object(result)
    render json: beers
  end

  private

  def build_url
    'https://api.punkapi.com/v2/beers'
  end

  def build_url_with_params(params)
    "https://api.punkapi.com/v2/beers?beer_name=#{params}"
  end

  def make_beer_request(url)
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
