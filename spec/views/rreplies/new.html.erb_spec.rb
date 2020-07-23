require 'rails_helper'

RSpec.describe "rreplies/new", type: :view do
  before(:each) do
    assign(:rreply, Rreply.new(
      reply: nil,
      content: "MyText"
    ))
  end

  it "renders new rreply form" do
    render

    assert_select "form[action=?][method=?]", rreplies_path, "post" do

      assert_select "input[name=?]", "rreply[reply_id]"

      assert_select "textarea[name=?]", "rreply[content]"
    end
  end
end
