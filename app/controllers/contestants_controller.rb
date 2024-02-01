class ContestantsController < ApplicationController
    def index
        @contestants = Contestant.all
    end

    def show
        @contestant = Contestant.find(params[:ID])
    end
end