require 'rails_helper'

RSpec.describe Outing, type: :model do 
  describe 'relationships' do 
    it {should have_many :contestant_outings}
    it {should have_many(:contestants).through(:contestant_outings)}
  end 

  describe "instance methods", type: :model do 
    it ".total_count_contestants" do 
      blet_1 = Bachelorette.create(name: "Lucy", season_number: 1, description: "best") 
      contestant_1 = Contestant.create!(name: "Jack", age: 19, hometown: "denver", bachelorette: blet_1 )

      outing_1 = Outing.create(name: "starbucks")
      outing_2 = Outing.create(name: "pizza hut")
      outing_3 = Outing.create(name: "mcd")
      contestant_1.outings << outing_1 << outing_2 
      #expect(outing_1.total_count).to eq(2)
    end 
  end
end
