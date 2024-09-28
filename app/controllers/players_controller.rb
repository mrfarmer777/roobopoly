class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = Player.new
    @player.name = params[:player][:name]
    @player.save
    redirect_to @player
  end

  def edit
  end

  def update
  end

  def show
    @player = Player.find(params[:id])
  end

  def index
    @players = Player.all
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_path
  end
end
