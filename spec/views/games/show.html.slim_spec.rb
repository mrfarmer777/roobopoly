require 'rails_helper'

RSpec.describe "games/show.html.slim", type: :view do
  let(:player_1) { Player.create(name: 'foo') }
  let(:player_2) { Player.create(name: 'bar') }

  it 'shows the game and player names' do
    game = assign(:game, Game.create(player_ids: [player_1.id, player_2.id]))

    render

    expect(rendered).to match /Game #{game.id}/
    expect(rendered).to match /foo/
    expect(rendered).to match /bar/
  end
end
