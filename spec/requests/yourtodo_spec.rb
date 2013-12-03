require 'spec_helper'

describe "your todo page" do

  let(:user) { FactoryGirl.create(:user) }
  let(:other_user) { FactoryGirl.create(:user, name: "others", email: "others@others.co.jp") }
  let!(:t1) { FactoryGirl.create(:todolist, user: user, title: "Fooooooo") }
  let!(:t2) { FactoryGirl.create(:todolist, user: user, title: "Barrrrrr") }
  let!(:t3) { FactoryGirl.create(:todolist, user: other_user, title: "OTHER_Barrrrrr") }

  before do
    visit signin_path
    fill_in "Email",    with: user.email.upcase
    fill_in "Password", with: user.password
    click_button "Sign in"
  end


  subject { page }

  describe "you can read your todolist" do
    it { should have_content(t1.title) }
    it { should have_content(t2.title) }
    it { should have_content(user.todolists.count) }
  end

  describe "you can't read others todolist" do
    it { should_not have_content(t3.title) }
  end

  describe "you can see your todo list on calander" do
    
    before do
      click_link "view your todo on calendar"
    end

    it { should have_selector("div#calendar", :text => "") }

  end
end
