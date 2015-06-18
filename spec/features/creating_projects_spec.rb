require "rails_helper"

describe "Creating Projects" do

  scenario "A user can create a new project" do

    visit "/"
    click_link "New Project"
    fill_in "Name", with: "Home page redesign"
    fill_in "Description", with: "Changing .com page to bootstrap"
    click_button "Create Project"

    expect(page).to have_content("Project has been created.")

    project = Project.find_by(name: "Home page redesign")

    expect(page.current_url).to eql(project_url(project))

    title = "Home page redesign - Projects - Whiteboard"
    expect(page).to have_title(title)

  end

end
