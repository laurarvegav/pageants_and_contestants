class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.where(has_representative: true)
  end

  def show
    @contestant = Contestant.find(params[:ID])
  end

  def edit
    @contestant = Contestant.find(params[:ID])
  end

  def update
    @contestant = Contestant.find(params[:ID])
  
    if @contestant.update(contestant_params)
      redirect_to "/contestants/#{@contestant.id}"
    else
      render :edit
    end
  end

  private
    def contestant_params
      params.permit(:name, :years_of_experience, :has_representative)
    end
end