require 'rails_helper'

RSpec.feature "CreateTeams", type: :feature do
  scenario 'Admin creates a team' do
    visit 'admin/teams/new'

    fill_in "Name", with: 'Manchester United'
    click_button "Create Team"

    expect(page).to have_text('Team "Manchester United" has been created')
  end
end
