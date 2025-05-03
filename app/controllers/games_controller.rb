class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new
    @game.users = User.find(params[:game][:user_ids].compact_blank)
    @game.save
    @game.initialize_spaces
    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
    @current_user_game = @game&.current_user_game
    render :show, locals: { game: @game, current_user_game: @current_user_game }
  end
end
