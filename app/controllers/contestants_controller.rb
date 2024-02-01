class ContestantsController < ApplicationController
    def index
        @contestants = Contestant.all
    end
end