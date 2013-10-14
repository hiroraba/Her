require 'spec_helper'

describe "todolists/edit" do
  before(:each) do
    @todolist = assign(:todolist, stub_model(Todolist,
      :content => "MyString",
      :priority => 1
    ))
  end

  it "renders the edit todolist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", todolist_path(@todolist), "post" do
      assert_select "input#todolist_content[name=?]", "todolist[content]"
      assert_select "input#todolist_priority[name=?]", "todolist[priority]"
    end
  end
end
