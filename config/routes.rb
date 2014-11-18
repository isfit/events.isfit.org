Rails.application.routes.draw do

  


  get 'marketing/poster'

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  post 'sessions' => 'sessions#create'

  get "2015/:id" => "events#show", :constraints =>  { :year => /\d/ }

  namespace :admin do
    resources :events do
      resources :event_dates
      member do
        patch "/event_dates" => "event_dates#update", :as => "/event"
        get :weight_move
      end
    end
    resources :event_places
    resources :speakers
  end

  get ":eventtype" => "events#index"


  root 'marketing#poster'


end
