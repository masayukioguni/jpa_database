require 'rails_helper'

RSpec.describe "lifters/index", :type => :view do
  before(:each) do
    assign(:lifters, [
      Lifter.create!(
        :index => "Index",
        :show => "Show"
      ),
      Lifter.create!(
        :index => "Index",
        :show => "Show"
      )
    ])
  end

  it "renders a list of lifters" do
    render
    assert_select "tr>td", :text => "Index".to_s, :count => 2
    assert_select "tr>td", :text => "Show".to_s, :count => 2
  end
end
