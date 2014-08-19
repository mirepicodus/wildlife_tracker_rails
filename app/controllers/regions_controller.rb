class RegionsController < ApplicationController
  def index
    @regions = Region.all
    @region = Region.new
    render('/regions/index.html.erb')
  end
end
