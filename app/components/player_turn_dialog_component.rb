class PlayerTurnDialogComponent < ViewComponent::Base
  def initialize(player:, game:)
    @player = player
    @game = game
  end

  def dom_id
    'player_turn_dialog'
  end

  def render?
    @game.current_player == @player
  end

  def call
    content_tag :div, id: dom_id, class: 'player-turn-dialog' do
      concat content_tag(:h2, "#{@player.name} has landed on an unowned property!")
      concat content_tag(:p, "Would you like to purchase this property?")
      concat content_tag(:button, 'Buy', class: 'make-move-button')
      concat content_tag(:button, 'No, thanks', class: 'make-move-button')
    end
  end
end