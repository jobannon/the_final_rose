class Bachelorette <ApplicationRecord
  has_many :contestants
  
  def average_age 
    Contestant.select(:age).where(bachelorette_id: self.id).average(:age)
  end

  def contestant_hometowns
    Contestant.select(:hometown).where(bachelorette_id: self.id).pluck(:hometown)
  end 

end
