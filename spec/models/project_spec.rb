require 'rails_helper'

RSpec.describe Project, type: :model do
  before :each do
    @group = create(:research_group, id:0)
  end
  it "has a valid factory" do
    create(:project, research_group_id:0 ).should be_valid
  end
  it "has a valid group" do
    expect{create(:project, research_group_id:56 )}.to raise_error(ActiveRecord::RecordInvalid)
  end
end