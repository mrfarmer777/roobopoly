require 'rails_helper'

RSpec.describe "games/index.html.slim", type: :view do
  it 'lists all of the games' do
    player1 = Player.create(name: 'foo')
    player2 = Player.create(name: 'bar')
    player3 = Player.create(name: 'baz')
    assign(:games, [Game.create(players: [player1, player2]), Game.create(players: [player1,player3])])

    render

    expect(rendered).to match /foo/
    expect(rendered).to match /bar/
    expect(rendered).to match /baz/
    expect(rendered).to have_selector('tr.game', count: 2)
  end

  it 'shows a link to the new game page' do
    render

    expect(rendered).to have_link('Create a New Game', href: new_game_path)
  end
end
