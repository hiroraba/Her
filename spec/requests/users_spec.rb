require 'spec_helper'

describe "Users" do

  let(:user) { FactoryGirl.create(:user) }
  
  subject { page }

  describe "Can't access user page" do
    before { visit user_path(user) }
    it { should have_selector("h1", :text => "No Contents") }
  end
  
  describe "Can't access users page" do
    before { visit users_path }
    it { should have_selector("h1", :text => "No Contents") }
  end
end
