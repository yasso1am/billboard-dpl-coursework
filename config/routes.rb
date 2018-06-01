Rails.application.routes.draw do

  root 'staticpages#home'

  resources :boards do
    get 'songs/addtoboard', to: 'songs#addtoboard'
    post 'songs/addtoboard/:song_id', to: 'songs#boardupdate'
  end
  
  
  resources :artists do
    resources :songs
  end
  
  get 'songs/all'

  

  scope 'artists/:artist_id', as: 'artist' do
    resources :songs, only: [:new, :create]
  end

end
