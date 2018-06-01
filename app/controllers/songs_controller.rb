class SongsController < ApplicationController
  before_action :set_artist, except: [:all, :addtoboard, :boardupdate]
    # before_action :set_artist, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :set_board, only: [:addtoboard, :boardupdate]
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def addtoboard
    @songs = Song.all
  end

  def boardupdate
    binding.pry
    if @board.update(song_params)
      redirect_to [@board]
    else
      render :addtoboard
    end
  end

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

  def set_board
    @board = Board.find(params[:board_id])
  end

  def song_params
    binding.pry
    params.require(:song).permit(:name, :rating, :board_id)
  end
end
