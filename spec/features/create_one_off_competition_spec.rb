require 'rails_helper'

RSpec.feature 'CreateOneOffCompetition', type: :feature do
  let(:manchester) { 'Manchester United' }
  let(:real) { 'Real Madrid' }

  scenario 'Admin executes a one off competition' do
    visit '/admin/tournaments'

    click_button('Create One-off Competition')

    fill_in 'Name', with: manchester
    click_button 'Add Player'

    expect(page).to have_text("1. #{manchester}")
    #
    # fill_in 'Name', with: real
    # click_button 'Add Player'
    #
    # expect(page).to have_text("2. #{real}")
    #
    # click_button('Start competition')
    #
    # fill_in 'Player', with: manchester
    # fill_in 'Points', with: 2
    # click_button 'Add'
    #
    # expect(page).to have_text("#{manchester} scored 2 points")
    #
    # fill_in 'Player', with: real
    # fill_in 'Points', with: 3
    # click_button 'Add'
    #
    # expect(page).to have_text("#{real} scored 3 points")
    #
    # click_button 'Finish competition'
    #
    # expect(page).to have_text("#{real} wins")
    # expect(page).to have_text("#{manchester} 2 - 3 #{real}")
  end
end
