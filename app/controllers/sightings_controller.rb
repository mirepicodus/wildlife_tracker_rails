class SightingsController < ApplicationController
  def create
    @animal = Animal.find(params[:id])
    @sightings = @animal.sightings.all
    @sighting = @animal.sightings.new(params[:sighting])
    if @sighting.save
      render('/animals/success.html.erb')
    else
      render('/animals/show.html.erb')
    end
  end
end
