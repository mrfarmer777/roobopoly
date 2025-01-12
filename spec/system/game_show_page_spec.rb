require 'rails_helper'
require 'spec_helper'

describe 'Game Show Page', type: :system do

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

    expect(page).to have_selector('.space__container', text: 'foo', count: 1)
    expect(page).to have_selector('.space__container', text: 'bar', count: 1)
  end

  it 'allows the players to roll and move' do
    player1 = Player.create(name: 'foo')
    player2 = Player.create(name: 'bar')
    game = Game.create(players: [player1, player2])
    game.initialize_spaces
    player1_game = game.player_games.find_by(player: player1)
    player2_game = game.player_games.find_by(player: player2)
    player1_game.update(position: 1)
    player2_game.update(position: 2)
    mock_dice_one = instance_double(Dice, roll: 5)
    mock_dice_two = instance_double(Dice, roll: 6)
    allow(Dice).to receive(:new).and_return(mock_dice_one, mock_dice_two)

    visit game_path(game)
    click_button 'Roll and Move'

    expect(page).to have_content('foo rolled a 5')
    expect(page).to have_selector('.space__container#space-6', text: 'foo')
    expect(page).to have_content("It's your turn, bar")

    click_button 'Roll and Move'
    expect(page).to have_content('bar rolled a 6')
    expect(page).to have_selector('.space__container#space-8', text: 'bar')
  end

end