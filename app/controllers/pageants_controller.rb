class PageantsController < ApplicationController
    def index
      @pageants = Pageant.order(created_at: :desc)
    end

    def show
      if params[:id] == 'new'
        render :new
      else
        @pageant = Pageant.find(params[:id])
      end
    end

    def new
    end

    def create
      pageant = Pageant.create(pageant_params)
      redirect_to "/pageants"
    end

    def edit
      @pageant = Pageant.find(params[:id])
    end

    def update
      @pageant = Pageant.find(params[:id])
      
      if @pageant.update(pageant_params)
        redirect_to "/pageants/#{@pageant.id}"
      else
        render :edit
      end
    end

    def destroy
      @pageant = Pageant.find(params[:id])
      @contest = Contestant.where(pageant_id: params[:id])
      @contest.destroy_all
      @pageant.destroy
      redirect_to '/pageants'
    end

    private
    def pageant_params
      params.permit(:name, :scheduled, :version_number)
    end

    def contestant_params
      params.permit(:name, :years_of_experience, :has_representative)
    end
end