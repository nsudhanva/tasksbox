class SandboxController < ApplicationController
  def clients
  	@clients = Client.all
  	#@client = Client.find(3)
  	#@client_by_id = Client.find(1, 2)
  end

  def projects
  	@projects = Project.all
  	#@projects = Project.where('client_id = ?', 5)
  	#@projects = Project.where('start_date >= ? AND start_date <= ?', Date.parse("2016-03-01"), Date.parse("2016-03-31")) 	
  	#@projects = Project.order('start_date DESC')
  	#@projects = Project.order('start_date DESC').limit(5)
  end

  def job_results
    technology = params[:technology]
    location = params[:location]
    response = HTTParty.get("http://api.indeed.com/ads/apisearch?publisher=7277146494571922&q=#{technology}&co=india&l=#{location}&format=json&v=2")
    @job_results = response.parsed_response
  end
end
   