require 'rails_helper'
require 'spec_helper'

describe 'Game Show Page', type: :system, js: true do

  it 'shows the player tokens on the appropriate squares' do
    player1 = Player.create(name: 'foo')
    player2 = Player.create(name: 'bar')
    game = Game.create(players: [player1, player2])
    game.initialize_spaces
    player1_game = game.player_games.find_by(player: player1)
    player2_game = game.player_games.find_by(player: player2)
    player1_game.update(position: 1)
    player2_game.update(position: 2)

    visit game_path(game)

    expect(page).to have_selector('.space-container', text: 'foo', count: 1)
    expect(page).to have_selector('.space-container', text: 'bar', count: 1)
  end

end