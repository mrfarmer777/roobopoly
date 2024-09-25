require 'rails_helper'

describe Dice, type: :model do
  describe '#roll' do
    it 'returns a random number between 1-12' do
      results = []
      dice = Dice.new
      30.times do
        results << dice.roll
      end

      expect(results.min >= 1).to be_truthy
      expect(results.max <= 12).to be_truthy
    end
  end
end