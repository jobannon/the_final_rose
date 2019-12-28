require "rails_helper"

RSpec.describe "as a visitor" do 
  describe "when I visit contestants show page" do 
    it "shows me the contestants
      -name
      -season_number
      -description AND
      -a list of outings that this contestant has been on " do

      @blet_1 = Bachelorette.create(name: "Lucy", season_number: 1, description: "best") 

      @contestant_1 = Contestant.create!(name: "Jack", age: 19, hometown: "denver", bachelorette: @blet_1 )
      @contestant_2 = Contestant.create!(name: "Bob", age: 50, hometown: "texas" , bachelorette: @blet_1 )

      @outing_1 = Outing.create(name: "starbucks")
      @outing_2 = Outing.create(name: "pizza hut")

      @contestant_1.outings << @outing_1 << @outing_2 
      @contestant_2.outings << @outing_1 << @outing_2 


      visit "/contestants/#{@contestant_1.id}" 
      
      expect(page).to have_content(@contestant_1.name)
      expect(page).to have_content(@contestant_1.bachelorette.season_number )
      expect(page).to have_content(@contestant_1.bachelorette.description)
    end 
  end
end


