require 'rails_helper'

RSpec.describe "players/show.html.slim", type: :view do
  it 'shows the player name' do
    assign(:player, Player.create(name: 'foo'))

    render

    expect(rendered).to match /foo/
  end
end
