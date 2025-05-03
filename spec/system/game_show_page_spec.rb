require 'rails_helper'
require 'spec_helper'

describe 'Game Show Page', type: :system do
  it 'shows the user tokens on the appropriate squares' do
    user1 = User.create(name: 'foo')
    user2 = User.create(name: 'bar')
    game = Game.create(users: [user1, user2])
    game.initialize_spaces
    user1_game = game.user_games.find_by(user: user1)
    user2_game = game.user_games.find_by(user: user2)
    user1_game.update(position: 1)
    user2_game.update(position: 2)

    visit game_path(game)

    expect(page).to have_selector('.space__container', text: 'foo', count: 1)
    expect(page).to have_selector('.space__container', text: 'bar', count: 1)
  end

  it 'allows the users to roll and move' do
    user1 = User.create(name: 'foo')
    user2 = User.create(name: 'bar')
    game = Game.create(users: [user1, user2])
    game.initialize_spaces
    user1_game = game.user_games.find_by(user: user1)
    user2_game = game.user_games.find_by(user: user2)
    user1_game.update(position: 1)
    user2_game.update(position: 2)
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

  it 'updates the users in all game windows', js: true do
    user1 = User.create(name: 'foo')
    user2 = User.create(name: 'bar')
    game = Game.create(users: [user1, user2])
    game.initialize_spaces
    user1_game = game.user_games.find_by(user: user1)
    user2_game = game.user_games.find_by(user: user2)
    user1_game.update(position: 1)
    user2_game.update(position: 2)
    mock_dice_one = instance_double(Dice, roll: 5)
    mock_dice_two = instance_double(Dice, roll: 6)
    allow(Dice).to receive(:new).and_return(mock_dice_one, mock_dice_two)

    visit game_path(game)
    click_button 'Roll and Move'

    Capybara.using_session('other user') do
      visit game_path(game)
      expect(page).to have_selector('.space__container#space-6', text: 'foo')
      expect(page).to have_content("It's your turn, bar")
      click_button 'Roll and Move'
    end

    expect(page).to have_selector('.space__container#space-8', text: 'bar')
  end
end