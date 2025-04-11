require 'rails_helper'

describe Game, type: :model do
  let(:player1) { Player.create(name: "Player 1") }
  let(:player2) { Player.create(name: "Player 2") }
  let(:game) do
    Game.create(players: [player1, player2])
  end
  describe 'associations' do
    it { should have_many(:player_games) }
    it { should have_many(:players).through(:player_games) }
    it { should have_many(:spaces) }

    it 'destroys all related spaces when destroyed' do

      other_game = Game.create(players: [player1, player2])
      game.spaces.create(position: 1, name: "Go")
      game.spaces.create(position: 2, name: "Free Parking")
      game.spaces.create(position: 3, name: "Boardwalk")
      other_game.spaces.create(position: 1, name: "Go")
      game.destroy
      expect(Space.count).to eq(1)
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:players) }

    it 'validates that at least two players are present' do
      game = Game.new
      game.players.build(name: "Player 1")
      expect(game.valid?).to be false
      game.players.build(name: "Player 2")
      expect(game.valid?).to be true
    end
  end

  it 'initializes with a turn of 1' do
    expect(Game.new.turn).to eq(1)
  end

  describe '#increment_turn' do
    it 'increments the turn by 1' do
      game.increment_turn
      expect(game.reload.turn).to eq(2)
    end
  end

  describe '#initialize_spaces' do
    it 'creates 40 spaces' do
      game.initialize_spaces
      expect(game.spaces.count).to eq(40)
    end

    it 'creates spaces with names, colors, and types loaded from default board' do
      game.initialize_spaces
      game.reload
      ordered_spaces = game.spaces.order(:position)
      expect(ordered_spaces.first.name).to eq("Go")
      expect(ordered_spaces.first).to be_a(ActionSpace)
      expect(ordered_spaces.second.name).to eq("Mediterranean Avenue")
      expect(ordered_spaces.second).to be_a(PropertySpace)
      expect(ordered_spaces.second.color).to eq("#8B4513")
      expect(ordered_spaces.second.type).to eq("PropertySpace")
      expect(ordered_spaces.last.name).to eq("Boardwalk")
    end

    it 'creates a property for each property space' do
      game.initialize_spaces
      game.reload
      property_spaces = game.spaces.where(type: "PropertySpace")
      expect(property_spaces.count).to eq(26)
      expect(property_spaces.first.property).to be_a(Property)
      expect(property_spaces.first.property.price).to eq(60)
      expect(property_spaces.last.property.price).to eq(400)
    end
  end

  describe '#current_player_game' do
    it 'returns the player game for the player whose turn it is' do
      player1_game = game.player_games.find_by(player: player1)
      player2_game = game.player_games.find_by(player: player2)
      player1_game.update(position: 1)
      player2_game.update(position: 2)
      expect(game.current_player_game).to eq(player1_game)

      game.increment_turn
      expect(game.current_player_game).to eq(player2_game)

      game.increment_turn
      expect(game.current_player_game).to eq(player1_game)
    end
  end
end