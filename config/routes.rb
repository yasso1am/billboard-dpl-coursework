Rails.application.routes.draw do

  root 'staticpages#home'

  resources :boards do
    resources :songs
  end

  resources :artists do
    resources :songs
  end
  
  get 'songs/all'

  get 'songs/addtoboard'

  scope 'artists/:artist_id', as: 'artist' do
    resources :songs, only: [:new, :create]
  end

end
