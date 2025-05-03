require 'rails_helper'

describe Property, type: :model do
  describe 'associations' do
    it { should belong_to(:property_space) }
    it { should belong_to(:owner).class_name('UserGame').optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:property_space) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:base_rent) }
  end
end