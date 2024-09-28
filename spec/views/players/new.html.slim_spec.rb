require 'rails_helper'

RSpec.describe "players/new.html.slim", type: :view do
  it 'shows the player name' do
    assign(:player, Player.new)

    render

    expect(rendered).to match /Enter player name/
    expect(rendered).to have_selector("input[type='text']")
    expect(rendered).to have_selector("input[type='submit']")
  end
end
