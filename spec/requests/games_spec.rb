require 'rails_helper'

RSpec.describe "Games", type: :request do
  describe 'POST /games' do
    let(:player1) { Player.create(name: 'foo') }
    let(:player2) { Player.create(name: 'bar') }

    it 'creates a game' do
      post '/games', params: { players: { id: [player1.id, player2.id] } }

      created_game = Game.last
      expect(created_game.players).to include(player1)
      expect(created_game.players).to include(player2)
      game_path = game_path(created_game)
      expect(response).to redirect_to(game_path)
    end
  end
end
