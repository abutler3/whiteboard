require "rails_helper"

describe "Viewing Projects" do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project, name: "Home page redesign") }

  before do
    login_as(user)
    #assign_role! method will create a new Role record and will be
    #responsible for giving the specified user a role on the specified project.
    assign_role!(user, :viewer, project)
  end

  scenario "with the project details" do
    visit "/"
    click_link "Home page redesign"
    expect(page.current_url).to eql(project_url(project))
  end

  scenario "unless they do not have permission" do
    FactoryGirl.create(:project, name: "Hidden")
    visit "/"
    expect(page).not_to have_content "Hidden"
  end

end
