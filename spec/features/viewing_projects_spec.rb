require "rails_helper"

describe "Viewing Projects" do

  scenario "Listing all projects" do
    project = FactoryGirl.create(:project, name: "Home page redesign")
    visit "/"
    click_link "Home page redesign"
    expect(page.current_url).to eql(project_url(project))
  end

end
