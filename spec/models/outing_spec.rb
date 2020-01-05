require 'rails_helper'

RSpec.describe Outing, type: :model do 
  describe 'relationships' do 
    it {should have_many :contestant_outings}
    it {should have_many(:contestants).through(:contestant_outings)}
  end 

  describe "instance methods", type: :model do 
    it ".contestants_count" do 
      blet_1 = Bachelorette.create(name: "Lucy", season_number: 1, description: "best") 
      contestant_1 = Contestant.create!(name: "Jack", age: 19, hometown: "denver", bachelorette: blet_1 )
      contestant_2 = Contestant.create!(name: "Bob", age: 50, hometown: "texas" , bachelorette: blet_1 )

      outing_1 = Outing.create(name: "starbucks")

      outing_1.contestants << contestant_1 << contestant_2

      expect(outing_1.contestants_count).to eq(2)
    end 
  end
end
