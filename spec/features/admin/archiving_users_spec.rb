require "rails_helper"

describe "An admin can archive users" do
  let(:admin_user) { FactoryGirl.create(:user, :admin) }
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(admin_user)
  end

  scenario "successfully" do
    visit admin_user_path(user)
    click_link "Archive User"

    expect(page).to have_content("User has been archived")
    expect(page).to_not have_content user.email

  end

  scenario "but cannot archive themselves" do
    visit admin_user_path(admin_user)
    click_link "Archive User"

    expect(page).to have_content("You cannot archive yourself!")
    expect(page).to_not have_content user.email

  end
end