require "rails_helper"

RSpec.describe "as a visitor" do 
  describe "when I visit the bachelorette show page" do 
    before(:each) do 
      @blet_1 = Bachelorette.create!(name: "Lucy", season_number: 1, description: "best") 
      @contestant_1 = Contestant.create!(name: "Jack", age: 19, hometown: "denver", bachelorette: @blet_1 )
      @contestant_2 = Contestant.create!(name: "Bob", age: 50, hometown: "texas", bachelorette: @blet_1)
      @blet_1.contestants << @contestant_1 << @contestant_2
    end 
    it " I see the average age of all that bachelorettes conestants" do 

      visit "/bachelorettes/#{@blet_1.id}"

      within "#bachelorette-#{@blet_1.id}" do 
        expect(page).to have_content(@blet_1.average_age )
      end 
    end 
  end
end
