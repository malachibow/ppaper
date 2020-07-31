require 'rails_helper'

RSpec.describe "reply_favorites/edit", type: :view do
  before(:each) do
    @reply_favorite = assign(:reply_favorite, ReplyFavorite.create!(
      reply: nil
    ))
  end

  it "renders the edit reply_favorite form" do
    render

    assert_select "form[action=?][method=?]", reply_favorite_path(@reply_favorite), "post" do

      assert_select "input[name=?]", "reply_favorite[reply_id]"
    end
  end
end
