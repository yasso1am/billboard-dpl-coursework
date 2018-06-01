class SongsController < ApplicationController
  before_action :set_artist, except: [:all]
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def all
    @songs = Song.all
  end


  def index
    @songs = @artist.songs
  end

  def show
  end

  def new
    @song = @artist.songs.new
    render :form
  end

  def edit
    render :form
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

private
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :rating)
  end
end
