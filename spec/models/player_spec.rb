require 'rails_helper'

RSpec.describe Player, type: :model do

  describe 'validations' do
    let(:subject) { Player.new }
    it { should validate_presence_of(:name) }
  end
end
