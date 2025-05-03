require 'rails_helper'

RSpec.describe "games/index.html.slim", type: :view do
  it 'lists all of the games' do
    user1 = User.create(name: 'foo')
    user2 = User.create(name: 'bar')
    user3 = User.create(name: 'baz')
    assign(:games, [Game.create(users: [user1, user2]), Game.create(users: [user1,user3])])

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
