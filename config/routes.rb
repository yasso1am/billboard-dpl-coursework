Rails.application.routes.draw do

  root 'staticpages#home'

  resources :boards do
    resources :artists
    resources :songs
  end
  
  # scope 'artists/:artist_id', as: 'artist' do
  #   resources :songs, only: [:new, :create]
  # end

end
