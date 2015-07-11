require "rails_helper"

describe "Viewing Tickets" do
  before do
    user = FactoryGirl.create(:user)
    redesign = FactoryGirl.create(:project, name: "Website redesign")
    FactoryGirl.create(:ticket, project: redesign, title: "Add bootstrap", description: "CSS Framework", author: user)


    ie = FactoryGirl.create(:project, name: "Internet Explorer")
    FactoryGirl.create(:ticket, project: ie, title: "Standards compliance", description: "Not a joke.", author: user)

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
