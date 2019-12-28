require "rails_helper"

RSpec.describe "as a visitor" do 
  describe "when visit an outing show page " do 
    it "shows me the outings 
        -Name
        -Location
        -date
        -total_count of contestants on this one outing
        -names of contestants that went on this outing" do 

      @blet_1 = Bachelorette.create!(name: "Lucy", season_number: 1, description: "best") 

      @contestant_1 = Contestant.create!(name: "Jack", age: 19, hometown: "denver", bachelorette: @blet_1 )
      @contestant_2 = Contestant.create!(name: "Bob", age: 50, hometown: "texas" , bachelorette: @blet_1 )

      @outing_1 = Outing.create!(name: "starbucks" )
      @outing_2 = Outing.create!(name: "pizza hut")

      @contestant_1.outings << @outing_1 << @outing_2 
      @contestant_2.outings << @outing_1 << @outing_2 

      visit outing_path(@contestant_1.outings[0]) 

      expect(page).to have_content(@outing_1.name)
      expect(page).to have_content(@outing_1.location)
      expect(page).to have_content(@outing_1.when)
      expect(page).to have_content("count: 2")
      expect(page).to have_content(@contestant_1.name)
      expect(page).to have_content(@contestant_1.name)
    end 
  end
end

