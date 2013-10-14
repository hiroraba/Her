require 'spec_helper'

describe "todolists/index" do
  before(:each) do
    assign(:todolists, [
      stub_model(Todolist,
        :content => "Content",
        :priority => 1
      ),
      stub_model(Todolist,
        :content => "Content",
        :priority => 1
      )
    ])
  end

  it "renders a list of todolists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
