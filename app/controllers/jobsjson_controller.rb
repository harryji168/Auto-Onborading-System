class JobsjsonController < ApplicationController
  def index
    @jobsum= JobsDaySum.all.limit(3) 
  end
end
