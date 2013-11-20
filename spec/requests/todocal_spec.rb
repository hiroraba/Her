require 'spec_helper'

describe "todo calender spec" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    visit signin_path
    fill_in "Email",    with: user.email.upcase
    fill_in "Password", with: user.password
    click_button "Sign in"
  end

  describe "You can't see Canlender before visit todocal_path " do
    it { expect(page).not_to have_content('Calender') }
  end
  
  describe "You can see Canlender after visit todocal_path " do
    before do
      visit 'calendar/index'
    end
    it { expect(page).to have_selector('div#calendar', :text => "") }
  end
end
