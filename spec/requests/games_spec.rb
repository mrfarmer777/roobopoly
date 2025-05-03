require 'rails_helper'

RSpec.describe "Games", type: :request do
  describe 'POST /games' do
    let(:user1) { User.create(name: 'foo') }
    let(:user2) { User.create(name: 'bar') }

    it 'creates a game' do
      post '/games', params: { game: { user_ids: [user1.id, user2.id] } }

      created_game = Game.last
      expect(created_game.users).to include(user1)
      expect(created_game.users).to include(user2)
      game_path = game_path(created_game)
      expect(response).to redirect_to(game_path)
    end

    it 'initializes the game spaces' do
      post '/games', params: { game: { user_ids: [user1.id, user2.id] } }

      created_game = Game.last
      expect(created_game.spaces.count).to eq(40)
    end
  end
end
