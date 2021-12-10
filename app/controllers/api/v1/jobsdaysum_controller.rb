class Api::V1::JobsdaysumController < ApplicationController

    def index
        #byebug
        #jobs = Job.all.order(id: :desc)
        #jobs = jobs_day_sum.all.order(date: :desc)

        if params[:date]
            jobslist=Job.all.order(id: :desc).where("date= ?", params[:date])
            render json: jobslist , each_serializer: JobswaitforcheckSerializer  

        else    

        #    jobs= JobsDaySum.all 
        #    render json: jobs
          #  jobs= Job.group(:date).order("date desc").count  

           # jobs= Job.group{ |date| date[0].itself  } 

         #   @jobs=JobsDaySum.job
         #   json_response(@jobs)
            # jobs= JobsDaySum.all 
            # render json: jobs {
            #     :include => {:date }
            # }
            @jobsum= JobsDaySum.all.limit(3) 
        end 
 
    end
end
