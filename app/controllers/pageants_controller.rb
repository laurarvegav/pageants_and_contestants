class PageantsController < ApplicationController
    def index
        @pageants = Pageant.order(created_at: :desc)
    end

    def show
        @pageant = Pageant.find(params[:id])
    end

    def contest
        @contest = Contestant.where(pageant_id: params[:id])
    end
end