require 'rails_helper'

RSpec.describe "reply_favorites/index", type: :view do
  before(:each) do
    assign(:reply_favorites, [
      ReplyFavorite.create!(
        reply: nil
      ),
      ReplyFavorite.create!(
        reply: nil
      )
    ])
  end

  it "renders a list of reply_favorites" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
