require "rails_helper"

describe "Deleting Tickets" do
  let!(:project) { FactoryGirl.create(:project) }
  let(:author) { FactoryGirl.create(:user) }
  let!(:ticket) do
    FactoryGirl.create(:ticket, project: project, author: author)
  end

  before do
    login_as(author)
    assign_role!(author, :viewer, project)
    visit project_ticket_path(project, ticket)
  end

  scenario "deleted successfully" do
    click_link "Delete Ticket"

    expect(page).to have_content("Ticket has been deleted.")
    expect(page.current_url).to eq(project_url(project))
  end
end
