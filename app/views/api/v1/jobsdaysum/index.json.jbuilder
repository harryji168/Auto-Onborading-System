json.jobs  @jobsum do |job|
    json.date job.date
    json.count job.count

    jobslist=Job.all.order(id: :desc).where("date= ?", job.date)
    json.detail jobslist do |job|
        json.date job.date
        json.title job.title
        json.company job.company
        json.place job.place
        json.link job.link
        #json.skills job.required_skills
    end    
end