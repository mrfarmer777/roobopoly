require 'rails_helper'

RSpec.describe "games/show.html.slim", type: :view do
  let(:user_1) { User.create(name: 'foo') }
  let(:user_2) { User.create(name: 'bar') }
  let(:game) { Game.create(user_ids: [user_1.id, user_2.id]) }

  before(:each) do
    game.initialize_spaces
    assign(:game, game)
    render locals: { current_player: game.current_player, game: }
  end

  it 'shows the game and user names' do

    expect(rendered).to match /Game #{game.id}/
    expect(rendered).to match /foo/
    expect(rendered).to match /bar/
  end

  it 'shows a link to the games index page' do
    # render

    expect(rendered).to have_link('Back to Games', href: games_path)
  end

  it 'shows a link to the new game page' do
    # render

    expect(rendered).to have_link('Create a New Game', href: new_game_path)
  end

  it 'lists the game spaces' do
    # render

    expect(rendered).to have_selector('div.space__container', count: 40)
  end

  it 'lists the purchase price of each space' do
    # render

    game.spaces.where(type: 'PropertySpace').each do |property_space|
      expect(rendered).to have_content(property_space.property.price)
    end
  end
end
