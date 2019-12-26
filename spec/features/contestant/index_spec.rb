
require "rails_helper"

RSpec.describe "as a visitor" do 
  describe "when visit /bachelorettes/bachelorette_id/contestants" do 
    it " shows me a a list of contestants with 
    -age 
    -hometown 
    -their name is a link to their show page /contestants/:id" do 

      @blet_1 = Bachelorette.create(name: "Lucy", season_number: 1) 
      @contestant_1 = Contestant.create(name: "Jack", age: 19, hometown: "denver" )
      @contestant_2 = Contestant.create(name: "Bob", age: 50, hometown: "texas" )
      @blet_1.contestants << @contestant_1 << @contestant_2

      visit "/bachelorettes/#{@blet_1.id}/contestants"

      expect(page).to have_content(@contestant_1.name)
      expect(page).to have_content(@contestant_1.age)
      expect(page).to have_content(@contestant_1.hometown)

      within "#contestant-#{@contestant_1.id}" do  
        click_link @contestant_1.name 
      end 

      expect(current_path).to eq("/contestants/#{@contestant_1.id}")

     end
  end 
end 
