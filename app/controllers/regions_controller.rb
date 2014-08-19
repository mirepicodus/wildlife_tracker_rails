class RegionsController < ApplicationController
  def index
    @regions = Region.all
    @region = Region.new
    render('/regions/index.html.erb')
  end

  def create
    @regions = Region.all
    @region = Region.create(params[:region])
    render('/regions/index.html.erb')
  end
end
