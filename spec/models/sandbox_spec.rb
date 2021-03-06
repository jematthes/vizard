require 'rails_helper'

RSpec.describe Sandbox, :type => :model do
  it "has a valid factory" do
    FactoryGirl.create(:sandbox).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:sandbox, name: nil).should_not be_valid
  end
end
