class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new
    @game.players = Player.find(params[:players][:id])
    @game.save
    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
  end
end
