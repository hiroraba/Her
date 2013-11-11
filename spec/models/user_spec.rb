require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "mario", email: "user@example.com", 
		    password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token)}
  it { should respond_to(:authenticate)}

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = "" } 
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = "" } 
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 11 } 
    it { should_not be_valid }
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com",
		       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "remember token" do
    before { @user.save }
    its(:remember_token) {should_not be_blank}
  end

  describe "todolist assciation" do
    before { @user.save }

    let!(:older_todolists) do
      FactoryGirl.create(:todolist, user: @user, created_at: 1.day.ago)
    end

    let!(:newer_todolists) do
      FactoryGirl.create(:todolist, user: @user, created_at: 1.hour.ago)
    end

    it "should have the right list in the right order" do
      expect(@user.todolists.to_a).to eq [newer_todolists, older_todolists]
    end
  end
end
