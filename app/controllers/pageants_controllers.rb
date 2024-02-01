class PageantsControllers < ApplicationController
    def index
        @pageants = Pageant.all
    end

    def new

    end
end