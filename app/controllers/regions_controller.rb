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

  def show
    @region = Region.find(params[:id])
    render('regions/show_regions.html.erb')
  end

  def update
    @region = Region.find(params[:id])
    @region.update(params[:region])
    render('regions/show_regions.html.erb')
  end
end
