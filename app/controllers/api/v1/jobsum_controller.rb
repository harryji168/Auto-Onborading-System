class Api::V1::JobsumController < ApplicationController

    

    def index
        #byebug
        #jobs = Job.all.order(id: :desc)
        #jobs = jobs_day_sum.all.order(date: :desc)

        

        #jobs= JobsDaySum.all
        # render json: jobs

        #jobscount=Job.count
        if params[:tag]
            if params[:count]
            #jobslist=Job.all.order(id: :desc).where("").limit(10)  .limit(10) 
            #jobslist=Job.all.order(id: :desc).find_or_initialize_by(company: params[:tag])
                jobscount=Job.all.order(id: :desc).where("required_skills LIKE ?", "%"+params[:tag]+"%").count
                render json: jobscount
            else
                jobslist=Job.all.order(id: :desc).where("required_skills LIKE ?", "%"+params[:tag]+"%")
                render json: jobslist , each_serializer: JobswaitforcheckSerializer  
            end    
        else
            #jobscount=Job.count
            #render json: jobscount

            jobslist=Job.all.order(id: :desc).limit(30) 
            render json: jobslist , each_serializer: JobswaitforcheckSerializer  
        end    
    end
 
end   