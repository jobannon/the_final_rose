class ContestantsController < ApplicationController
  def index 
    @blet = Bachelorette.find(params[:bachelorette_id])
  end 

  def show
    @contestant = Contestant.find(params[:contestant_id])
    
  end 
end 

