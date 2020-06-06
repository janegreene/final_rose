require 'rails_helper'
RSpec.describe "when visiting bachelorettes show page" do
  before :each do
    @bachelorette1 = Bachelorette.create!(name: "Hannah Brown",
                                          season_number: 15, description: "Absolutely wild!!")
    @peter = @bachelorette1.contestants.create!(name: "Pilot pete", age: 28, hometown: "Los Angeles")
    @gregg = @bachelorette1.contestants.create!(name: "Old Gregg", age: 38, hometown: "Over there")
    visit "/bachelorettes/#{@bachelorette1.id}"
  end
  it "can see the bachelorettes info " do
    expect(page).to have_content(@bachelorette1.name)
    expect(page).to have_content(@bachelorette1.season_number)
    expect(page).to have_content(@bachelorette1.description)
  end
  it "can click through to bachelorettes to contestants" do
    click_link "Contestants"
    expect(current_path).to eq("/bachelorettes/#{@bachelorette1.id}/contestants")
    expect(page).to have_link(@bachelorette1.contestants.first.name)
    expect(page).to have_content(@bachelorette1.contestants.last.name)
    expect(page).to have_content(@bachelorette1.contestants.first.age)
    expect(page).to have_content(@bachelorette1.contestants.first.hometown)
    expect(page).to have_content(@bachelorette1.contestants.last.age)
    expect(page).to have_content(@bachelorette1.contestants.last.hometown)

  end
  it "can click through to contestants show page" do
    click_link "Contestants"
    expect(current_path).to eq("/bachelorettes/#{@bachelorette1.id}/contestants")
    click_link("#{@bachelorette1.contestants.first.name}")
    expect(current_path).to eq("/contestants/#{@bachelorette1.contestants.first.id}")
  end

  it "can see contestants average age" do
    expect(page).to have_content("Average age of contestants: 33")
  end

end

# ser Story 5 of 6
#
# As a visitor,
# When I visit a bachelorette show page
# I see the average age of all of that bachelorette's contestants
#
# (e.g. "Average Age of Contestants: 29.5")
