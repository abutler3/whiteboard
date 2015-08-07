require "rails_helper"

describe "Users can only see the appropriate links" do
  # Create a non-admin user
  let!(:user) { FactoryGirl.create(:user) }
  # Create a admin user
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let!(:project) { FactoryGirl.create(:project) }

  context "anonymous users" do
    scenario "cannot see the New Project link" do
      visit '/'
      expect(page).not_to have_link "New Project"
    end
  end

  context "non-admin users (project viewers)" do
    before do
      login_as(user)
      assign_role!(user, :viewer, project)
    end

    scenario "cannot see the New Project link" do
      visit '/'
      expect(page).not_to have_link "New Project"
    end

    scenario "cannot see the Edit Project link" do
      visit project_path(project)
      expect(page).not_to have_link "Edit Project"
    end
  end

  context "admin users" do
    before { login_as(admin) }

    scenario "can see the New Project link" do
      visit '/'
      expect(page).to have_link "New Project"
    end

    scenario "can see the Edit Project link" do
      visit project_path(project)
      expect(page).to have_link "Edit Project"
    end
  end

  context "anonymous users" do
    scenario "cannot see the New Project link" do
      visit project_path(project)
      expect(page).not_to have_link "Delete Project"
    end
  end

  context "regular users" do
    before { login_as(user) }

    scenario "cannot see the New Project link" do
      visit project_path(project)
      expect(page).not_to have_link "Delete Project"
    end
  end

  context "admin users" do
    before { login_as(admin) }

    scenario "can see the New Project link" do
      visit project_path(project)
      expect(page).to have_link "Delete Project"
    end
  end
end
