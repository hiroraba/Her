require 'spec_helper'

describe Todolist do
  
  let(:user) { FactoryGirl.create(:user) }

  before do
    @todolist = Todolist.new(title: "I watched TV.", priority: 1, user_id: user.id)
  end

  subject { @todolist }

  it { should respond_to(:title)}
  it { should respond_to(:user_id)}
  it { should respond_to(:priority)}
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before {@todolist.user_id = nil }
    it { should_not be_valid }
  end

  describe "with brank content" do
    before { @todolist.title = "" }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @todolist.title = "a"*1000 }
    it { should_not be_valid }
  end

  describe "with content that is too short" do
    before { @todolist.title = "a"*3 }
    it { should_not be_valid }
  end
end
