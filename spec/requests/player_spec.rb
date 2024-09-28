require 'rails_helper'

RSpec.describe "Players", type: :request do
  describe 'POST /players' do
    it 'creates a player' do
      post '/players', params: { player: { name: 'foo' } }

      player = Player.last
      expect(player.name).to eq('foo')
      player_path = player_path(player)
      expect(response).to redirect_to(player_path)
    end
  end

  describe 'DELETE /players/:id' do
    it 'deletes a player' do
      player = Player.create(name: 'foo')
      delete "/players/#{player.id}"

      expect(Player.count).to eq(0)
      expect(response).to redirect_to(players_path)
    end
  end

end
