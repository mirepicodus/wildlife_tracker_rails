class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
    @animal = Animal.new
    render('animals/index.html.erb')
  end

  def create
    @animals = Animal.all
    @animal = Animal.new(params[:animal])
    if @animal.save
      render('animals/success.html.erb')
    else
      render('animals/index.html.erb')
    end
  end

  def show
    @regions = Region.all
    @animals = Animal.all
    @animal = Animal.find(params[:id])
    @sighting = Sighting.new(animal_id: @animal.id)
    render('animals/show.html.erb')
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(params[:animal])
      render('animals/success.html.erb')
    else
      render('animals/index.html.erb')
    end
  end

  def destroy
    @animals =Animal.all
    @animal = Animal.find(params[:id])
    @animal.sightings.each {|sighting| sighting.destroy}
    @animal.destroy
    render('animals/index.html.erb')
  end
end
