require 'rails_helper'
RSpec.describe "when visiting outings show page" do
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
    ContestantOuting.create!(outing_id: @outing1.id , contestant_id: @gregg.id)

  end
  it "can see the outing details" do
    visit "/outings/#{@outing1.id}"

    expect(page).to have_content("Kickball")
    expect(page).to have_content("Texas")
    expect(page).to have_content("09/12/19")
    expect(page).to have_content("Total Contestants: 2")
    expect(page).to have_content("Contestants: Pilot pete, Old Gregg")
  end
end

#
#   User Story 4 of 6
# As a visitor,
# When I visit an outings show pages,
# I see that outings name, location, and date
# And I see a total count of contestants that were on this outing
# And I see a list of all names of the contestants that went on this outing
#
# (e.g.       Helicopter Ride
#             Location: Bali
#             Date: 09/12/19
#           Count of Contestants: 3
# Contestants: JoJo Fletcher, Kaitlyn Bristowe, Hannah Brown)
