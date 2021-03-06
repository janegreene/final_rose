require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it {should belong_to :bachelorette}
  end
  describe "methods " do
    it 'average_age' do
      @bachelorette1 = Bachelorette.create!(name: "Hannah Brown",
                                            season_number: 15, description: "Absolutely wild!!")
      @peter = @bachelorette1.contestants.create!(name: "Pilot pete", age: 28, hometown: "Los Angeles")
      @gregg = @bachelorette1.contestants.create!(name: "Old Gregg", age: 38, hometown: "Over there")
      @outing1 = Outing.create!(name: "Kickball", location: "Texas", date: "09/12/19")
      ContestantOuting.create!(outing_id: @outing1.id , contestant_id: @peter.id)
      ContestantOuting.create!(outing_id: @outing1.id , contestant_id: @gregg.id)

      expect(@bachelorette1.contestants.average_age).to eq(33)
    end
    it 'unique_hometowns' do
      @bachelorette1 = Bachelorette.create!(name: "Hannah Brown",
                                            season_number: 15, description: "Absolutely wild!!")
      @peter = @bachelorette1.contestants.create!(name: "Pilot pete", age: 28, hometown: "Los Angeles")
      @gregg = @bachelorette1.contestants.create!(name: "Old Gregg", age: 38, hometown: "Over there")
      @bob = @bachelorette1.contestants.create!(name: "Bob Bobby", age: 33, hometown: "Over there")

      expect(@bachelorette1.contestants.unique_hometowns).to eq("Los Angeles, Over there")
    end
  end
end
