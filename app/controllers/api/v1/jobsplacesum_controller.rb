class Api::V1::JobsplacesumController < ApplicationController

    def index
        
        jobs= JobsPlaceSum.all
        render json: jobs
    end
 
end
