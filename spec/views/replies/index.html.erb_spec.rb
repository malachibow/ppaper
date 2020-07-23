require 'rails_helper'

RSpec.describe "replies/index", type: :view do
  before(:each) do
    assign(:replies, [
      Reply.create!(
        post: nil,
        user: nil,
        report: false
      ),
      Reply.create!(
        post: nil,
        user: nil,
        report: false
      )
    ])
  end

  it "renders a list of replies" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
