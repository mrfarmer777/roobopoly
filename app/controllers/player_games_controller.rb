class PlayerGamesController < ApplicationController

  def move
    @player_game = PlayerGame.find(params[:id])
    @player = @player_game.player
    @game = @player_game.game
    roll = Dice.new.roll
    @player_game.increment_position(roll)
    @game.increment_turn
    flash[:notice] = "#{@player.name} rolled a #{roll}"
    redirect_to game_path(@player_game.game)
  end
end
