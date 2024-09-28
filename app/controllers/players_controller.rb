class PlayersController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
    @player = Player.find(params[:id])
  end

  def index
  end

  def delete
  end
end
