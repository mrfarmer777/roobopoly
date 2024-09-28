require 'rails_helper'

RSpec.describe "games/new.html.slim", type: :view do
  it 'shows the players selection input' do
    players = [Player.new(name: "Player 1"), Player.new(name: "Player 2")]
    assign(:players, players)

    render

    expect(rendered).to match /Create a New Game/
    expect(rendered).to have_selector('select[name="game[players]"]'), count: 2
  end
end
