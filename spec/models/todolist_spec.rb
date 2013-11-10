require 'spec_helper'

describe Todolist do
  
  let(:user) { FactoryGirl.create(:user) }

  before do
    @todolist = Todolist.new(content: "I watched TV.", priority: 1, user_id: user.id)
  end

  subject { @todolist }

  it { should respond_to(:content)}
  it { should respond_to(:user_id)}
  it { should respond_to(:priority)}
end
