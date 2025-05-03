require 'rails_helper'

RSpec.describe "games/new.html.slim", type: :view do
  it 'shows the users selection input' do
    users = [User.new(name: "User 1"), User.new(name: "User 2")]
    assign(:users, users)

    render

    expect(rendered).to match /Create a New Game/
    expect(rendered).to have_selector('select[name="game[user_ids][]"]')
  end

  it 'shows a link to the games index page' do
    render

    expect(rendered).to have_link('Back to Games', href: games_path)
  end
end
