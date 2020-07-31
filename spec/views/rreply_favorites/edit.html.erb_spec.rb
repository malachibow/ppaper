require 'rails_helper'

RSpec.describe "rreply_favorites/edit", type: :view do
  before(:each) do
    @rreply_favorite = assign(:rreply_favorite, RreplyFavorite.create!(
      rreply: nil
    ))
  end

  it "renders the edit rreply_favorite form" do
    render

    assert_select "form[action=?][method=?]", rreply_favorite_path(@rreply_favorite), "post" do

      assert_select "input[name=?]", "rreply_favorite[rreply_id]"
    end
  end
end
