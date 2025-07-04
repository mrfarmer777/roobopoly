require 'rails_helper'

describe Game, type: :model do
  let(:user1) { User.create(name: "User 1") }
  let(:user2) { User.create(name: "User 2") }
  let(:game) do
    Game.create(users: [user1, user2])
  end
  describe 'associations' do
    it { should have_many(:players) }
    it { should have_many(:users).through(:players) }
    it { should have_many(:spaces) }

    it 'destroys all related spaces when destroyed' do

      other_game = Game.create(users: [user1, user2])
      game.spaces.create(position: 1, name: "Go")
      game.spaces.create(position: 2, name: "Free Parking")
      game.spaces.create(position: 3, name: "Boardwalk")
      other_game.spaces.create(position: 1, name: "Go")
      game.destroy
      expect(Space.count).to eq(1)
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:users) }

    it 'validates that at least two users are present' do
      game = Game.new
      game.users.build(name: "User 1")
      expect(game.valid?).to be false
      game.users.build(name: "User 2")
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

  describe '#current_player' do
    it 'returns the user game for the user whose turn it is' do
      user1_game = game.players.find_by(user: user1)
      user2_game = game.players.find_by(user: user2)
      user1_game.update(position: 1)
      user2_game.update(position: 2)
      expect(game.current_player).to eq(user1_game)

      game.increment_turn
      expect(game.current_player).to eq(user2_game)

      game.increment_turn
      expect(game.current_player).to eq(user1_game)
    end
  end

  describe '#player_can_purchase_current_space?' do
    let(:player_1) { game.players.find_by(user: user1) }
    let(:player_2) { game.players.find_by(user: user2) }
    let(:property_space) { game.spaces.find_by(name: "Mediterranean Avenue") }

    before do
      game.initialize_spaces
      player_1.update(position: 2)
      player_2.update(position: 3)
    end

    it 'returns true if the player is on a property space and has enough money' do
      expect(game.player_can_purchase_current_space?(player_1)).to be true
    end

    it 'returns false if the player is not on a property space' do
      player_1.update(position: 3)
      expect(game.player_can_purchase_current_space?(player_1)).to be false
    end

    it 'returns false if the player does not have enough money' do
      player_1.update(money: 0)
      expect(game.player_can_purchase_current_space?(player_1)).to be false
    end
  end
end