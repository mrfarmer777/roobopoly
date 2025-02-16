require 'rails_helper'

RSpec.describe PropertySpace, type: :model do
  describe 'associations' do
    it { should have_one(:property) }
  end
end
