require 'rails_helper'

RSpec.describe "rreplies/show", type: :view do
  before(:each) do
    @rreply = assign(:rreply, Rreply.create!(
      reply: nil,
      content: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
