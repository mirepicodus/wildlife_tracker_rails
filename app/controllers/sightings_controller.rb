class SightingsController < ApplicationController
  def create
    @animal = Animal.find(params[:id])
    @sighting = @animal.sightings.new(params[:sighting])
    if @sighting.save
      render('/animals/success.html.erb')
    else
      render('/animals/show.html.erb')
    end
  end

  def show
    @sighting = Sighting.find(params[:id])
    render('sightings/show_sighting.html.erb')
  end

  # def update
  #   @animal = Animal.find(params[:id])

  # end

end
