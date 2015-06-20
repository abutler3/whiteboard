require "rails_helper"

describe "Creating Projects" do

  before do

    visit "/"
    click_link "New Project"

  end

  scenario "A user can create a new project" do

    fill_in "Name", with: "Home page redesign"
    fill_in "Description", with: "Changing .com page to bootstrap"
    click_button "Create Project"

    expect(page).to have_content("Project has been created.")

    project = Project.find_by(name: "Home page redesign")

    expect(page.current_url).to eql(project_url(project))

    title = "Home page redesign - Projects - Whiteboard"
    expect(page).to have_title(title)

  end

  scenario "A user cannot create project without a name" do

    click_button "Create Project"

    expect(page).to have_content("Project has not been created.")
    expect(page).to have_content("Name can't be blank")


  end

end
