class PlayersController < ApplicationController

  def move
    @player = Player.find(params[:id])
    @user = @player.user
    @game = @player.game
    roll = Dice.new.roll


    @player.increment_position(roll)
    if @game.player_can_purchase_current_space?(@player)
      @property = @game.spaces.find_by(position: @player.position).property
      redirect_to edit_game_property_path(game_id: @game.id, id: @property.id ), layout: 'modal'
    else
      @game.increment_turn
      flash[:notice] = "#{@user.name} rolled a #{roll}"

      redirect_to game_path(@player.game)
    end
  end
end
