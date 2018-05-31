class ArtistsController < ApplicationController
  before_action :set_artist, only [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def show
  end

  def new
    @artist = Artist.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :form
    end
  end

  def update
    if @artist.update(arist_params)
      redirect_to @artist
    else
      render :form
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

  private
    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name)
    end
end
