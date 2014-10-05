require 'rails_helper'

RSpec.describe "lifters/edit", :type => :view do
  before(:each) do
    @lifter = assign(:lifter, Lifter.create!(
      :index => "MyString",
      :show => "MyString"
    ))
  end

  it "renders the edit lifter form" do
    render

    assert_select "form[action=?][method=?]", lifter_path(@lifter), "post" do

      assert_select "input#lifter_index[name=?]", "lifter[index]"

      assert_select "input#lifter_show[name=?]", "lifter[show]"
    end
  end
end
