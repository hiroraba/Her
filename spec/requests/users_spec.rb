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

  describe "Create User" do

    before do
      visit signup_path
    end

    let(:submit) { "Create my account" }

    describe "with invalid infomation" do
      it "shound not create a user" do
	expect { click_button submit}.not_to change(User, :count)
      end

    end

    describe "with valid infomation" do

      before do
	fill_in "Name",  with: "Test User"
	fill_in "Email", with: "user@test.com"
	fill_in "Password", with: "foobar"
	fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
	expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end
