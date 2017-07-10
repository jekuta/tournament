require 'rails_helper'

RSpec.feature "CreateCompetitors", type: :feature do
  scenario 'Admin creates a competitor' do
    visit 'admin/competitors/new'

    fill_in "Name", with: 'Manchester United'
    click_button "Create Competitor"

    expect(page).to have_text('Competitor "Manchester United" has been created')
  end
end
