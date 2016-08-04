class AnnouncementsController < ApplicationController
  def index
  	@announcements = current_user.announcements
  	@announcement = Announcement.new
  end

  def new
  	
  end

  def create
  	@announcement = Announcement.new(announcement_params)
  	@announcement.user_id = current_user.id 

  	if @announcement.save
       announcement = Announcement.find(params[:id])
  		redirect_to announcements_path, notice: "Successfully created"
  		AnnounceIt.completed(announcement, current_user).deliver!
  	else
  		render action: "new"
  	end
  end

  private
  	def announcement_params
  		params[:announcement].permit(:title, :body, :user_id)
  	end
end
