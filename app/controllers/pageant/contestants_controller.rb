class Pageant::ContestantsController < ApplicationController

  def index
    @pageant = Pageant.find(params[:id])
    @contestants = @pageant.contestants

    @contestants = @contestants.order_alpha if params[:sort]

    if params[:show_contestants_with_more_than]
      years_of_experience_threshold = params[:show_contestants_with_more_than].to_i
      @contestants = @contestants.where("years_of_experience > ?", years_of_experience_threshold)
    end
  end 

  def new
    @pageant = Pageant.find(params[:id])
  end

  def create
    @pageant = Pageant.find(params[:id])
    @contestant = Contestant.create!(
      name: params[:name], 
      years_of_experience: params[:years_of_experience], 
      has_representative: params[:has_representative], 
      pageant_id: @pageant.id
      )

    if @contestant.save
      @pageant.contestants << @contestant
  
      redirect_to "/pageants/#{@pageant.id}/contestants"
    else
      render :index
    end
  end
end