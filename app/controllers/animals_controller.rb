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
end
