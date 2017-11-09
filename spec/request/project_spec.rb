require 'rails_helper'

RSpec.describe "login", :type => :request do
  it "can login" do
    user = create(:user)
    get "/login"
    assert_select "form.form" do
      assert_select "input[name=?]", "user[email]"
      assert_select "input[name=?]", "user[password]"
      assert_select "input[type=?]", "submit"
    end

    post "/login", :user[:email] => user, :user[:password] => "secrets1"
    assert_select ".header .username", :text => "jdoe"
  end
end
