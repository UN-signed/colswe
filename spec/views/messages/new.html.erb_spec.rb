require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
      :from_id => 1,
      :to_id => 1,
      :subject => "MyString",
      :message => "MyText"
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "input[name=?]", "message[from_id]"

      assert_select "input[name=?]", "message[to_id]"

      assert_select "input[name=?]", "message[subject]"

      assert_select "textarea[name=?]", "message[message]"
    end
  end
end
