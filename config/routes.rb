Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :team_maps, only: [:create]

  get "team_maps/:code" => 'team_maps#show', as: :team_map

  root "team_maps#new"
end
