require 'rails_helper'

RSpec.describe ResearchGroup, type: :model do
  it "has a valid factory" do
    create(:research_group).should be_valid
  end
end
