require 'rails_helper'

RSpec.describe Lifter, :type => :model do
  describe 'male' do
    it "男性" do
      @lifter = FactoryGirl.create(:lifter,:gender => "male")
      expect(@lifter.male?).to eq(true)
    end
  end
end
