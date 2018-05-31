class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only [:show, :edit, :update, :destroy]
  
  def index
    @songs = @artist.songs

  def show
  end

  def new
    @song = @artist.songs.new
    render: form
  end

  def edit
    render: form
  end

  def create
    @song = @artist.songs.new(song_params)
    
    if @song.save
    redirect_to [@artist, @song]

    else 
      render :new
    end
  end

  def update
    if @song.update(song_params)
      redirect_to [@artist, @song]
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to artist_songs_path
end
