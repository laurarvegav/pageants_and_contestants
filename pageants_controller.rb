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
      @pageant = Pageant.find(params[:id])
      @contest = Contestant.where(pageant_id: params[:id])
    end 

    def process_contest_input
      @pageant = Pageant.find(params[:id])
      
      years_of_experience_threshold = params[:show_contestants_with_more_than].to_i
      @contest = Contestant.where(pageant_id: params[:id])
                          .where("years_of_experience > ?", years_of_experience_threshold)

      render :contest
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

    def contest_new
      @pageant = Pageant.find(params[:id])
    end

    def contest_create
      @pageant = Pageant.find(params[:id])
      @contestant = @pageant.contestants.create!(name: params[:name], years_of_experience: params[:years_of_experience], has_representative: params[:has_representative], pageant_id: @pageant.id)

      if @contestant.save
        @pageant.contestants << @contestant
    
        redirect_to "/pageants/#{@pageant.id}/contest"
      else
        render :contest
      end
    end

    def contest_order
      @contest = Contestant.where(pageant_id: params[:id]).order(:name)
    end

    def get_id
      render :edit
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