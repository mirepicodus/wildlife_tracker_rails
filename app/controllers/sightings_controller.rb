class SightingsController < ApplicationController
  def create
    @regions = Region.all
    @animal = Animal.find(params[:id])
    @sighting = @animal.sightings.new(params[:sighting])
    if @sighting.save
      redirect_to("/#{@animal.id}")
    else
      render('/animals/show.html.erb')
    end
  end

  def show
    @regions = Region.all
    @sighting = Sighting.find(params[:id])
    @animal = @sighting.animal
    @selected = @regions.map do |region|
      region.id == @sighting.region_id ? "selected" : ""
    end
    render('sightings/show_sighting.html.erb')
  end

  def update
    @sighting = Sighting.find(params[:id])
    @sighting.update(params[:sighting])
    @animal = @sighting.animal
    redirect_to("/#{@animal.id}")
  end

  def destroy
    @regions = Region.all
    @sighting = Sighting.find(params[:id])
    @animal = Animal.find(@sighting.animal_id)
    @sighting.destroy
    render('/animals/show.html.erb')
  end

  def reports
    @regions = Region.all
    @sightings = Sighting.all.order(:date)
    render('/sightings/report.html.erb')
  end

  def by_date
    @regions = Region.all
    start_date = params[:sightings][:start_date]
    end_date = params[:sightings][:end_date]
    if params[:sightings][:region_id] == ""
      @sightings = Sighting.where(:date => start_date..end_date).order(:date)
    elsif (params[:sightings][:start_date] == "") || (params[:sightings][:end_date] == "")
      @sightings = Sighting.where(:region_id => params[:sightings][:region_id]).order(:date)
    else
      @sightings = Sighting.where(:region_id => params[:sightings][:region_id], :date => start_date..end_date).order(:date)
    end
    render('/sightings/report.html.erb')
  end

end


