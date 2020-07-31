require 'rails_helper'

RSpec.describe "rreply_favorites/new", type: :view do
  before(:each) do
    assign(:rreply_favorite, RreplyFavorite.new(
      rreply: nil
    ))
  end

  it "renders new rreply_favorite form" do
    render

    assert_select "form[action=?][method=?]", rreply_favorites_path, "post" do

      assert_select "input[name=?]", "rreply_favorite[rreply_id]"
    end
  end
end
