require 'rails_helper'
RSpec.describe "when visiting contestants show page" do
  before :each do
    @bachelorette1 = Bachelorette.create!(name: "Hannah Brown",
                                          season_number: 15, description: "Absolutely wild!!")
    @peter = @bachelorette1.contestants.create!(name: "Pilot pete", age: 28, hometown: "Los Angeles")
    @gregg = @bachelorette1.contestants.create!(name: "Old Gregg", age: 39, hometown: "Over there")
    @outing1 = Outing.create!(name: "Kickball", location: "Texas", date: "09/12/19")
    @outing2 = Outing.create!(name: "Sky Diving", location: "Dallas", date: "09/14/19")
    @outing3 = Outing.create!(name: "Boxing", location: "Ft Worth", date: "09/16/19")
    ContestantOuting.create!(outing_id: @outing1.id , contestant_id: @peter.id)
    ContestantOuting.create!(outing_id: @outing2.id , contestant_id: @peter.id)
    ContestantOuting.create!(outing_id: @outing3.id , contestant_id: @gregg.id)

  end
  it "can see the contestants details" do
    visit "/contestants/#{@peter.id}"
    expect(page).to have_content(@peter.name)
    expect(page).to have_content(@bachelorette1.season_number)
    expect(page).to have_content(@bachelorette1.description)
    expect(page).to have_content("Kickball")
    expect(page).to have_content("Sky Diving")
    expect(page).not_to have_content("Boxing")

    click_link "Sky Diving"
    expect(current_path).to eq("/outings/#{@outing2.id}")
  end

end
# rails g migration CreateOutings name:string location:string date:string
# rails g migration CreateContestantOutings contestant:references outing:references

# User Story 3 of 6
#
# As a visitor,
# When I visit a contestants show page,
# I see that contestants name as well as the season number and season description that this contestant was on.
# I also see a list of names of the outings that this contestant has been on while on the show.
# (e.g.
#                         Ben Higgins
# Season 20 - No wait, THIS is the most dramatic season yet
#
# Outings: Kickball
#         Hot Springs
#         Helicopter Ride
# )
# When I click on an outing name, I'm taken to that outings show page
