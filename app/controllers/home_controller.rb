class HomeController < ApplicationController
  def index
   headers['Access-Control-Allow-Origin'] = '*'
  end
end