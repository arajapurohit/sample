
class DemoController < ApplicationController

require 'rubygems'
require 'json'
require 'net/http'
require 'httparty'

  def index
    @response = HTTParty.get("http://192.254.141.167/~fstech/pic.php")
    @http_party_json = JSON.parse(@response.body)
  end
  
end
