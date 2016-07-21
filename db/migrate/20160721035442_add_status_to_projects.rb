class AddStatusToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :status, :string
  end
end

=begin

Project.all.each {|project| project.update_attributes: (status: ["new", "completed", "on-going"].sample)}	

Project.all.each do |project|
	project.status = ["new", "completed", "on-going"].sample
	project.save
end

=end