require 'rails_helper'

RSpec.describe "replies/show", type: :view do
  before(:each) do
    @reply = assign(:reply, Reply.create!(
      post: nil,
      user: nil,
      report: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
