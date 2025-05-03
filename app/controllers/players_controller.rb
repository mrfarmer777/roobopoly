class PlayersController < ApplicationController

  def move
    @player = Player.find(params[:id])
    @user = @player.user
    @game = @player.game
    roll = Dice.new.roll
    @player.increment_position(roll)
    @game.increment_turn
    flash[:notice] = "#{@user.name} rolled a #{roll}"

    redirect_to game_path(@player.game)
  end
end
