Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'animals#index'})
  match('/', {:via => :post, :to => 'animals#create'})
  match('/:id', {:via => :get, :to => 'animals#show'})
  match('/:id', {:via => [:patch, :put], :to => 'animals#update'})

end
