class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update, :edit, :destroy]

  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @board = Board.new(board_params)
      if @board.save
        redirect_to @board
      else
        render :form
      end
  end

  def update
    if @board.update(board_params)
      redirect_to @board
    else
      render :form
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  private

    def set_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:name)
    end

end
