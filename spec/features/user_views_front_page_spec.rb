require "rails_helper"

RSpec.feature "Index Dashboard", :type => :feature do
  scenario "User visits new page" do
    visit "/pages/new"
    expect(page).to have_text("New Page")
  end
end
