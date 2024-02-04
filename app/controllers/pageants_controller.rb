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

    def contest
        @contest = Contestant.where(pageant_id: params[:id])
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

    private
    def pageant_params
      params.permit(:name, :scheduled, :version_number)
    end
end