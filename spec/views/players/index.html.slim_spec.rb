require 'rails_helper'

RSpec.describe "players/index.html.slim", type: :view do
  it 'lists all of the players' do
    assign(:players, [Player.create(name: 'foo'), Player.create(name: 'bar')])

    render

    expect(rendered).to match /foo/
    expect(rendered).to match /bar/
  end
end
