class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.where(has_representative: true)
  end

  def show
    @contestant = Contestant.find(params[:id])
  end

  def edit
    @contestant = Contestant.find(params[:id])
  end

  def update
    @contestant = Contestant.find(params[:id])
  
    if @contestant.update(contestant_params)
      redirect_to "/contestants/#{@contestant.id}"
    else
      render :edit
    end
  end

  def destroy
    contest = Contestant.find(params[:id])
    contest.destroy

    redirect_to '/contestants'
  end

  private
    def contestant_params
      params.permit(:name, :years_of_experience, :has_representative)
    end
end