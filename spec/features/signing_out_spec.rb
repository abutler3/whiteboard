require "rails_helper"

describe "A signed in user can sign out" do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user)
  end

  scenario "will sign out" do
    visit "/"
    click_link "Sign out"

    expect(page).to have_content("Signed out successfully.")


  end
end
