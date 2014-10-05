require 'rails_helper'

RSpec.describe "lifters/new", :type => :view do
  before(:each) do
    assign(:lifter, Lifter.new(
      :index => "MyString",
      :show => "MyString"
    ))
  end

  it "renders new lifter form" do
    render

    assert_select "form[action=?][method=?]", lifters_path, "post" do

      assert_select "input#lifter_index[name=?]", "lifter[index]"

      assert_select "input#lifter_show[name=?]", "lifter[show]"
    end
  end
end
