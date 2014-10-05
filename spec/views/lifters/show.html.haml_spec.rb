require 'rails_helper'

RSpec.describe "lifters/show", :type => :view do
  before(:each) do
    @lifter = assign(:lifter, Lifter.create!(
      :index => "Index",
      :show => "Show"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Index/)
    expect(rendered).to match(/Show/)
  end
end
