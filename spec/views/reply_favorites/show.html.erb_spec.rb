require 'rails_helper'

RSpec.describe "reply_favorites/show", type: :view do
  before(:each) do
    @reply_favorite = assign(:reply_favorite, ReplyFavorite.create!(
      reply: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
