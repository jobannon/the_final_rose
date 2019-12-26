require "rails_helper"

RSpec.describe "as a visitor" do
  describe "when I visit /bachlorettes/:id" do
    before(:each) do 
      @blet_1 = Bachelorette.create(name: "Lucy", season_number: 1) 
      @contestant_1 = Contestant.create(name: "Jack", age: 19, hometown: "denver" )
      @contestant_2 = Contestant.create(name: "Bob", age: 50, hometown: "texas" )
      @blet_1.contestants << @contestant_1 << @contestant_2
    end 
    it "shows me 
        1) Name 
        2) Season number 
        3) Description of the Season and a link to see their contestants" do 

      visit bachelorette_path(@blet_1)

      expect(page).to have_content(@blet_1.name)
      expect(page).to have_content(@blet_1.season_number)
      
      click_link("See Contestants")
      expect(page).to have_content(@contestant_1.name)
      expect(page).to have_content(@contestant_2.name)
    end 
  end
end

