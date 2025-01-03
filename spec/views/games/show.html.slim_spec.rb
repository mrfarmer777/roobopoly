require 'rails_helper'

RSpec.describe "games/show.html.slim", type: :view do
  let(:player_1) { Player.create(name: 'foo') }
  let(:player_2) { Player.create(name: 'bar') }
  let(:game) { Game.create(player_ids: [player_1.id, player_2.id]) }

  before(:each) do
    game.initialize_spaces
    assign(:game, game)
  end

  it 'shows the game and player names' do
    render

    expect(rendered).to match /Game #{game.id}/
    expect(rendered).to match /foo/
    expect(rendered).to match /bar/
  end

  it 'shows a link to the games index page' do
    render

    expect(rendered).to have_link('Back to Games', href: games_path)
  end

  it 'shows a link to the new game page' do
    render

    expect(rendered).to have_link('Create a New Game', href: new_game_path)
  end

  it 'lists the game spaces' do
    render

    expect(rendered).to have_selector('div.space-container', count: 40)
  end
end
