require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end

  describe "instance methods ", type: :model do 
    it ".average_age(bachelorette)" do 
      blet_1 = Bachelorette.create!(name: "Lucy", season_number: 1, description: "best") 
      contestant_1 = Contestant.create!(name: "Jack", age: 19, hometown: "denver", bachelorette: blet_1 )
      contestant_2 = Contestant.create!(name: "Bob", age: 50, hometown: "texas", bachelorette: blet_1)
      blet_1.contestants << contestant_1 << contestant_2

      expect(blet_1.average_age).to eq(34.5)
    end 
    
    it ".contestant_hometowns" do 
      blet_1 = Bachelorette.create!(name: "Lucy", season_number: 1, description: "best") 
      contestant_1 = Contestant.create!(name: "Jack", age: 19, hometown: "denver", bachelorette: blet_1 )
      contestant_2 = Contestant.create!(name: "Bob", age: 50, hometown: "texas", bachelorette: blet_1)
      blet_1.contestants << contestant_1 << contestant_2

      expect(blet_1.contestant_hometowns).to eq(["denver", "texas"])

    end 
  end 
end
