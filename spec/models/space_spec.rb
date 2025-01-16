require 'rails_helper'

RSpec.describe Space, type: :model do
  describe 'associations' do
    it { should belong_to(:game) }
  end

  describe 'validations' do
    it { should validate_numericality_of(:position).is_in(0..40).only_integer }
    it { should_not allow_value('##ffoobar').for(:color) }
    it { should allow_value('#ff00ff').for(:color) }


    it 'should allow color to be nil' do
      space = Space.new(color: nil, name: 'foo', position: 1)
      space.valid?
      expect(space.errors[:color]).to_not include('is not a valid hex color')
    end
  end
end
