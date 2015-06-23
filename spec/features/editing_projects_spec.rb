require "rails_helper"

describe "Editing Projects" do

  before do
    FactoryGirl.create(:project, name: "Home page redesign")
    visit "/"
    click_link "Home page redesign"
    click_link "Edit Project"
  end

  scenario "Updating a project" do
    fill_in "Name", with: ".com Redesign beta"
    click_button "Update Project"
    expect(page).to have_content("Project has been updated.")
  end

  scenario "Updating a project with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content("Project has not been updated.")
  end

end
