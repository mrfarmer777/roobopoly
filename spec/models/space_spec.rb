require 'rails_helper'

RSpec.describe Space, type: :model do
  describe 'associations' do
    it { should belong_to(:game) }
  end

  describe 'validations' do
    it { should validate_numericality_of(:position).is_in(0..40).only_integer }
  end
end
