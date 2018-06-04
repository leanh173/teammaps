Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount API::Base, at: "/"
  resources :team_maps, only: [:create]
  resources :member_locations, only: [:create]

  get "team_maps/:code/:member_name" => 'member_locations#show', as: :member_location
  get "team_maps/:code/member/new" => 'member_locations#new', as: :new_member_location

  root "team_maps#new"
  get 'grayscales/index'
end
