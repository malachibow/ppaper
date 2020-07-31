require 'rails_helper'

RSpec.describe "rreply_favorites/show", type: :view do
  before(:each) do
    @rreply_favorite = assign(:rreply_favorite, RreplyFavorite.create!(
      rreply: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
