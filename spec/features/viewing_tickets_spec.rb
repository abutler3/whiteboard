require "rails_helper"

describe "Viewing Tickets" do
  before do
    author = FactoryGirl.create(:user)
    redesign = FactoryGirl.create(:project, name: "Website redesign")
    assign_role!(author, :viewer, redesign)
    FactoryGirl.create(:ticket, project: redesign, author: author, title: "Add bootstrap", description: "CSS Framework")


    ie = FactoryGirl.create(:project, name: "Internet Explorer")
    assign_role!(author, :viewer, ie)
    FactoryGirl.create(:ticket, project: ie, author: author, title: "Standards compliance", description: "Not a joke.")
    login_as(author)
    visit "/"
  end

  scenario "with valid attributes" do

    click_link "Website redesign"

    expect(page).to have_content("Add bootstrap")
    expect(page).to_not have_content("Standards compliance")
    click_link "Add bootstrap"
    within("#ticket h2") do
      expect(page).to have_content("Add bootstrap")
    end
    expect(page).to have_content("CSS Framework")
  end
end
