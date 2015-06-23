require "rails_helper"

describe "Deleting Projects" do

  before do
    FactoryGirl.create(:project, name: "Home page redesign")
    visit "/"
    click_link "Home page redesign"
  end

  scenario "Deleting a project" do
    click_link "Delete Project"
    expect(page).to have_content("Project has been deleted.")
    visit "/"
    expect(page).to have_no_content("Home page redesign.")

  end



end
