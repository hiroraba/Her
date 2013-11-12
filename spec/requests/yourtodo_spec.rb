require 'spec_helper'

describe "your todo page" do

  let(:user) { FactoryGirl.create(:user) }
  let!(:t1) { FactoryGirl.create(:todolist, user: user, content: "Fooooooo", todotime: 1.hour.ago) }
  let!(:t2) { FactoryGirl.create(:todolist, user: user, content: "Barrrrrr", todotime: 1.hour.ago) }

  before do
    visit signin_path
    fill_in "Email",    with: user.email.upcase
    fill_in "Password", with: user.password
    click_button "Sign in"
  end

  subject { page }


  describe "todolist" do
  
    before { visit yourtodo_path }
    it { should have_content(t1.content) }
    it { should have_content(t2.content) }
    it { should have_content(user.todolists.count) }
  end
end
