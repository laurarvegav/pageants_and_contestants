class PageantsController < ApplicationController
    def index
        @pageants = Pageant.all
    end

    def show
        @pageant = Pageant.find(params[:id])
    end

    def contest
        @contest = Contestant.where(pageant_id: params[:id])
    end
end