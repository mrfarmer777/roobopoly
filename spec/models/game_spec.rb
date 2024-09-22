require 'rails_helper'

describe Game, type: :model do
  it 'is a thing' do
    expect(Game.new).to be_a(Game)
  end

  it 'initializes with a turn of 1' do
    expect(Game.new.turn).to eq(1)
  end
end