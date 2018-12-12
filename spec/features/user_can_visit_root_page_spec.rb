require 'rails_helper'

feature "User can visit root page" do
  scenario "and view navbar contents" do
    visit "/"
    within(".navbar") do
      expect(page).to have_content("AltFuelFinder")
      expect(page).to have_selector("input[value='Search by zip...']")
    end
  end
end

describe 'as a user' do
  it 'can visit the root page' do

    visit "/"
    fill_in 'q', with: '80203'
    click_on "Locate"

    expect(current_path).to eq(search_path)
    expect('.station'.count).to eq 10
    #Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(['Electric', 'Propane']).to include(station[0].fuel_type)
    expect(station[5].fuel_type).not_to eq('Gas')
    within('.station1')do
      expect(page).to have_content(station_1.name)
      expect(page).to have_content(station_1.address)
      expect(page).to have_content(station_1.fuel_type)
      expect(page).to have_content(station_1.distance)
      expect(page).to have_content(station_1.access_times)
    end
  end
end
