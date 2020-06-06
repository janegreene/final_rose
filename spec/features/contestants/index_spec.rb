require 'rails_helper'
RSpec.describe "when visiting contestants index page" do
  before :each do
    @bachelorette1 = Bachelorette.create!(name: "Hannah Brown",
                                          season_number: 15, description: "Absolutely wild!!")
    @peter = @bachelorette1.contestants.create!(name: "Pilot pete", age: 28, hometown: "Los Angeles")
    @gregg = @bachelorette1.contestants.create!(name: "Old Gregg", age: 38, hometown: "Over there")
    @bob = @bachelorette1.contestants.create!(name: "Bob Bobby", age: 33, hometown: "Over there")
    visit "/bachelorettes/#{@bachelorette1.id}/contestants"
  end

  it "can show unique list of contestants hometowns" do
    expect(page).to have_content( "These Contestants are from these hometowns: Los Angeles, Over there")
  end
end
