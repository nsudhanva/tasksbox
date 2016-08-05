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
      AnnounceIt.announce(@announcement, current_user).deliver!
  		redirect_to announcements_path, notice: "Successfully created"
  	else
  		render action: "new"
  	end
  end

  private
  	def announcement_params
  		params[:announcement].permit(:title, :body, :user_id)
  	end
end
