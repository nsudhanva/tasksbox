class SandboxController < ApplicationController
  def clients
  	@clients = Client.all
  	@client = Client.find(3)
  	@client_by_id = Client.find(1, 2)
  end

  def projects
  	#@projects = Project.all
  	#@projects = Project.where('client_id = ?',5)
  	#@projects = Project.where('start_date >= ? AND start_date <= ?', Date.parse("2016-03-01"), Date.parse("2016-03-31")) 	
  	#@projects = Project.order('start_date DESC')
  	@projects = Project.order('start_date DESC').limit(5)
  end
end
   