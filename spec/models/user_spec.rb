require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    let(:subject) { User.new }
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:players) }
    it { should have_many(:games) }
  end
end
