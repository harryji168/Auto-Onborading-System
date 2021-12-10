class Api::V1::JobswaitforcheckController < ApplicationController
  # include ActionController::Serialization    
    def index
     
        #jobscount=Job.count
        #jobscount=Job.where("check_count is null and required_skills is null")
        #jobscount=Job.where("length(required_skills)<300").order(id: :desc).limit(6)
        jobscount=Job.where(" (required_skills is null or length(required_skills)<160) and (check_count<>9 or check_count is null )  and company<>'Microsoft'  and company<>'Dropbox' and company<>'Apple'  and company<>'Electronic Arts (EA)' and company<>'Productboard' and company<>'Segment'  and company<>'Fortinet'  and company<>'Workday' and  title not like 'Work From Home%'  ").order(id: :desc).limit(6)        

        #jobscount=Job.order(id: :desc).limit(6) 
        render json: jobscount , each_serializer: JobswaitforcheckSerializer  
 
    end
end
