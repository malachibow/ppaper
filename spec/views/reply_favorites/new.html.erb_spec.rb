require 'rails_helper'

RSpec.describe "reply_favorites/new", type: :view do
  before(:each) do
    assign(:reply_favorite, ReplyFavorite.new(
      reply: nil
    ))
  end

  it "renders new reply_favorite form" do
    render

    assert_select "form[action=?][method=?]", reply_favorites_path, "post" do

      assert_select "input[name=?]", "reply_favorite[reply_id]"
    end
  end
end
