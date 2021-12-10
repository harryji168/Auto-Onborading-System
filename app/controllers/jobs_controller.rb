class JobsController < ApplicationController

    before_action :find_job , only:[:show, :edit, :update, :destroy]

    def jobs_post

        byebug
        sql="select * from jobs where linked_id = ':params[:linked_id]'"
         
        @results = ActiveRecord::Base.connection.exec_query(sql)
        
#   jobs_params = params[:required_skills]
#   job = Job.find params[:linked_id]
#    if job.update jobs_params
#     puts fdfd
#       redirect_to job_path(job)    
#    else
#     puts fdfd
#       render :edit
#    end 
       # byebug


    end


    def show
        render(:layout => "job_layout")
    end

    def index         
   #     @jobs = Job.all.order(id: :desc).where("required_skills is null").limit(1)       

    # @jobs = Job.all.order(id: :desc).where("required_skills is null and check_count is null  ").limit(1) 
     @jobs = Job.all.order("RANDOM()").where("required_skills is null and check_count is null  ").limit(1) 
    # @jobs = Job.all.order(id: :desc).where(" (required_skills is null or length(required_skills)<1) and (check_count<>1 or check_count<>9 or check_count is null ) and company<>'Microsoft'  and company<>'Dropbox' and company<>'Apple'  and company<>'Electronic Arts (EA)' and company<>'Productboard' and company<>'Segment'  and company<>'Fortinet'  and company<>'Workday' and  title not like 'Work From Home%'  ").limit(1) 

    # exec_query('select * from jobs', name = 'SQL', binds = [[nil, 'x'], [nil, 1]])
      
    #  execute <<-SQL
    #     UPDATE jobs
    #     SET required_skills = "checking"
    #     where id=@jobs.id
    #  SQL
    #  @jobs = Job.where("id=5263")

      params = ActionController::Parameters.new(check_count: 1)
      params.permit!
     @jobs.update params
     #byebug

    end

    def edit
    end

    def update
 

        if @job.update job_params
            redirect_to job_path(@job.id), notice: "Job edited"
        else
            render :edit
        end

    end


    private

    def job_params
        
        params.require(:job).permit(:title)
        
    end

    def find_job
       
        @job = Job.find_by_id params[:id]
        
    end

end
