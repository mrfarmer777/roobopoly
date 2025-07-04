class PropertiesController < ApplicationController

  def edit
    game = Game.find(params[:game_id])
    property = Property.find(params[:id])
    player = game.current_player
    space = property.property_space

    render :edit, layout: 'modal', locals: { player:, property:, space:, game: }
  end

  def update
    game = Game.find(params[:game_id])
    property = Property.find(params[:id])
    player = Player.find(params[:property][:owner_id])

    new_player_money = player.money - property.price

    player.update(money: new_player_money)
    property.update(owner: player)
    game.increment_turn
    flash[:notice] = "Property purchased successfully."

    redirect_to game_path(game)
  end
end
