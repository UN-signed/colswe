require 'rails_helper'

RSpec.describe "Project request", :type => :request do
  before :each do
    @group = create(:research_group, id:0)
    @project = create(:project)
    @user = create(:user)
    sign_in @user
  end
  it "show to group" do
    get "/projects/" + @project.id.to_s
    click_on "Descargar como PDF"
    assert_response :success 
  end
end