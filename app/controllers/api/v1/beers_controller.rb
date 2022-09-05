require 'rest-client'

class Api::V1::BeersController < ApplicationController
  def index
    beers = present_beer_index_request
    render json: beers
  end

  def show
    beer = present_beer_show_request(params[:id])
    render json: beer
  end

  private

  def build_url_for_index
    if params[:query].present?
      "https://api.punkapi.com/v2/beers?beer_name=#{params[:query]}"
    else
      'https://api.punkapi.com/v2/beers'
    end
  end

  def build_url_for_show(id)
    "https://api.punkapi.com/v2/beers/#{id}"
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

  def present_beer_index_request
    url = build_url_for_index
    result = make_beer_request(url)
    form_json_object(result)
  end

  def present_beer_show_request(id)
    url = build_url_for_show(id)
    result = make_beer_request(url)
    form_json_object(result)
  end
end
