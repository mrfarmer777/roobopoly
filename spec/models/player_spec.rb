require 'rails_helper'

RSpec.describe Player, type: :model do

  describe 'validations' do
    let(:subject) { Player.new }
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:player_games) }
    it { should have_many(:games) }
  end
end
