Rails.application.routes.draw do

  


  get 'marketing/poster'

  get 'login' => 'sessions#new'
  post 'logout' => 'sessions#destroy'
  post 'sessions' => 'sessions#create'

  get "2013/:id" => "events#show", :constraints =>  { :year => /\d/ }

  namespace :admin do
    resources :events do
      resources :event_dates
      member do
        get :weight_move
      end
    end
    resources :event_places
    resources :speakers
  end

  get ":eventtype" => "events#index"


  root 'marketing#poster'


end
