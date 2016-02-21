require 'rails_helper'

RSpec.describe Robot, type: :model do

  # let(:robot) { FactoryGirl.create(:robot) }

  before(:each) do
    @robot = FactoryGirl.create(:robot)
  end

  describe 'mechanics' do
    it 'says hello if friendly' do
      expect(@robot.greet).to eq('hello')
    end

    it 'says die human if unfriendly' do
      @robot.update(friendly: false)
      expect(@robot.greet).to eq('die human')
    end
  end
end
