require 'rails_helper'

RSpec.describe "views/edit", type: :view do
  before(:each) do
    @view = assign(:view, View.create!(
      post: nil,
      user: nil
    ))
  end

  it "renders the edit view form" do
    render

    assert_select "form[action=?][method=?]", view_path(@view), "post" do

      assert_select "input[name=?]", "view[post_id]"

      assert_select "input[name=?]", "view[user_id]"
    end
  end
end
