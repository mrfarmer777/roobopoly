class UserGamesController < ApplicationController

  def move
    @user_game = UserGame.find(params[:id])
    @user = @user_game.user
    @game = @user_game.game
    roll = Dice.new.roll
    @user_game.increment_position(roll)
    @game.increment_turn
    flash[:notice] = "#{@user.name} rolled a #{roll}"

    redirect_to game_path(@user_game.game)
  end
end
