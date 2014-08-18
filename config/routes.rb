Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'animals#index'})
  match('/', {:via => :post, :to => 'animals#create'})
end
