require 'rails_helper'

RSpec.describe Outing, type: :model do
  describe 'relationships' do
    it {should have_many :contestant_outings}
    it {should have_many(:contestants).through(:contestant_outings)}
  end
  describe 'methods' do
    it 'total_contestants' do
      @bachelorette1 = Bachelorette.create!(name: "Hannah Brown",
                                            season_number: 15, description: "Absolutely wild!!")
      @peter = @bachelorette1.contestants.create!(name: "Pilot pete", age: 28, hometown: "Los Angeles")
      @gregg = @bachelorette1.contestants.create!(name: "Old Gregg", age: 39, hometown: "Over there")
      @outing1 = Outing.create!(name: "Kickball", location: "Texas", date: "09/12/19")
      ContestantOuting.create!(outing_id: @outing1.id , contestant_id: @peter.id)
      ContestantOuting.create!(outing_id: @outing1.id , contestant_id: @gregg.id)

      expect(@outing1.total_contestants).to eq(2)
    end
    it 'all_contestants' do
      @bachelorette1 = Bachelorette.create!(name: "Hannah Brown",
                                            season_number: 15, description: "Absolutely wild!!")
      @peter = @bachelorette1.contestants.create!(name: "Pilot pete", age: 28, hometown: "Los Angeles")
      @gregg = @bachelorette1.contestants.create!(name: "Old Gregg", age: 39, hometown: "Over there")
      @outing1 = Outing.create!(name: "Kickball", location: "Texas", date: "09/12/19")
      ContestantOuting.create!(outing_id: @outing1.id , contestant_id: @peter.id)
      ContestantOuting.create!(outing_id: @outing1.id , contestant_id: @gregg.id)

      expect(@outing1.all_contestants).to eq("Pilot pete, Old Gregg")
    end
  end
end
