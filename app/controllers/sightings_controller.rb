class SightingsController < ApplicationController
  def create
    @regions = Region.all
    @animal = Animal.find(params[:id])
    @sighting = @animal.sightings.new(params[:sighting])
    if @sighting.save
      render('/animals/success.html.erb')
    else
      render('/animals/show.html.erb')
    end
  end

  def show
    @regions = Region.all
    @sighting = Sighting.find(params[:id])
    @selected = @regions.map do |region|
      region.id == @sighting.region_id ? "selected" : ""
    end
    render('sightings/show_sighting.html.erb')
  end

  def update
    @regions = Region.all
    @sighting = Sighting.find(params[:id])
    @sighting.update(params[:sighting])
    @animal = @sighting.animal
    render('/animals/show.html.erb')
  end

  def destroy
    @regions = Region.all
    @sighting = Sighting.find(params[:id])
    @animal = Animal.find(@sighting.animal_id)
    @sighting.destroy
    render('/animals/show.html.erb')
  end

end


