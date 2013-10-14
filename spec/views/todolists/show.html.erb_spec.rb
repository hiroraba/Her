require 'spec_helper'

describe "todolists/show" do
  before(:each) do
    @todolist = assign(:todolist, stub_model(Todolist,
      :content => "Content",
      :priority => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content/)
    rendered.should match(/1/)
  end
end
