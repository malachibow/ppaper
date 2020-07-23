require 'rails_helper'

RSpec.describe "rreplies/edit", type: :view do
  before(:each) do
    @rreply = assign(:rreply, Rreply.create!(
      reply: nil,
      content: "MyText"
    ))
  end

  it "renders the edit rreply form" do
    render

    assert_select "form[action=?][method=?]", rreply_path(@rreply), "post" do

      assert_select "input[name=?]", "rreply[reply_id]"

      assert_select "textarea[name=?]", "rreply[content]"
    end
  end
end
