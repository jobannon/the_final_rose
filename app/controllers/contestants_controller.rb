class ContestantsController < ApplicationController
  def index 
    @blet_contests = Bachelorette.find(params[:bachelorette_id]).contestants
  end 

  def show
    @contestant = Contestant.find(params[:id])
  end 
end 

