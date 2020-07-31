require 'rails_helper'

RSpec.describe "rreply_favorites/index", type: :view do
  before(:each) do
    assign(:rreply_favorites, [
      RreplyFavorite.create!(
        rreply: nil
      ),
      RreplyFavorite.create!(
        rreply: nil
      )
    ])
  end

  it "renders a list of rreply_favorites" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
