# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :beers do
    collection do
      get 'random', to: 'beers#random'
    end
  end
  get 'beers/:id', to: 'beers#show'
  get '/coverage/*path', to: 'coverage#show'
  get 'up' => 'rails/health#show', as: :rails_health_check
  # get '123', to: redirect('https://google.com')
end
