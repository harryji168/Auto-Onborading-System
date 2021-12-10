class MapController < ApplicationController

    

    def geo
        require 'uri'
        require 'net/http'
        require 'json'

        @places = JobsPlaceSum.all.order(count: :desc)

        @return=""
        @places.each do |place|
            @geo=Geo.where("place='"+place.place+"'") 
            if @geo.first then
            else    
                @return +=  place.place + " "+place.count.to_s+" "

                uri = URI('http://api.positionstack.com/v1/forward')
                
                params = {
                    'access_key' => 'd6000fb6c28e600a1bedf536adbf2c1a',
                    'query' => place.place ,
                    'limit' => 1
                }
                
                uri.query = URI.encode_www_form(params)
                
                response = Net::HTTP.get_response(uri)
                
                puts response.read_body
                
                ruby = JSON.parse(response.read_body)

                #byebug
                @geo_info=ruby['data'].first["latitude"].to_s+","+ruby['data'].first["longitude"].to_s

                

                params = ActionController::Parameters.new(place: place.place ,latlng:@geo_info )
                params.permit!
                @geo_new=Geo.new(params)
                if @geo_new.save
                    puts "done"
                else
                    puts "wrong"
                end         
                

             #  break
            end     
        end


        # @return=""
        # @places.each do |place|
        #     @return +=  place.place + " "+place.count.to_s+" "
        # end



        # uri = URI('http://api.positionstack.com/v1/forward')
        
        # params = {
        #     'access_key' => 'd6000fb6c28e600a1bedf536adbf2c1a',
        #     'query' => 'Burnaby, British Columbia, Canada',
        #     'limit' => 1
        # }
        
        # uri.query = URI.encode_www_form(params)
        
        # response = Net::HTTP.get_response(uri)
        
        # puts response.read_body
        
        # @geo=response.read_body
    end   


    def jobsmap
       @jobswaitforcheck=Job.where(" (required_skills is null or length(required_skills)<160) and (check_count<>9 or check_count is null )  and company<>'Microsoft'  and company<>'Dropbox' and company<>'Apple'  and company<>'Electronic Arts (EA)' and company<>'Productboard' and company<>'Segment'  and company<>'Fortinet'  and company<>'Workday' and  title not like 'Work From Home%'  ").order(id: :desc).count       

       @places = JobsPlaceSum.all.order(place: :asc)  #.limit(10) order(count: :desc) 

       @htmlcount=Job.all.order(id: :desc).where("required_skills LIKE '%HTML%' and date='"+DateTime.now.strftime("%F")+"' ").count
      # @csscount=Job.all.order(id: :desc).where("required_skills LIKE '%css%' and date='"+DateTime.now.strftime("%F")+"' " ).count
      # @jscount=Job.all.order(id: :desc).where("required_skills LIKE '%js%' and required_skills LIKE '%javascript%' ").count
       @nodecount=Job.all.order(id: :desc).where("required_skills ilIKE '%node%' and date='"+DateTime.now.strftime("%F")+"' " ).count
       @reactcount=Job.all.order(id: :desc).where("(required_skills ilIKE '%react%' ) and date='"+DateTime.now.strftime("%F")+"' ").count
       @railscount=Job.all.order(id: :desc).where("(required_skills ilike '%rails%' or required_skills ilike '%ruby%') and date='"+DateTime.now.strftime("%F")+"' ").count
       @phpcount=Job.all.order(id: :desc).where("(required_skills ilike '%PHP%' or   required_skills ilike '%wordpress%' )and date='"+DateTime.now.strftime("%F")+"'").count
       @vuecount=Job.all.order(id: :desc).where("required_skills ilike '%vue%' and date='"+DateTime.now.strftime("%F")+"'").count
       @javacount=Job.all.order(id: :desc).where("required_skills ilike '%java %' and date='"+DateTime.now.strftime("%F")+"'").count
       render layout: "emptylayout"
    end    

end
