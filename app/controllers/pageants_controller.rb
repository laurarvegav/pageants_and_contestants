class PageantsController < ApplicationController
    def index
        @pageants = Pageant.all
    end

    def show
        @pageant = Pageant.find(params[:id])
    end
end