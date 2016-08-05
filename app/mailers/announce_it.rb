class AnnounceIt < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.announce_it.announce.subject
  #
  def announce(announcement, user)
	  @announcement = announcement
	  @user = user
    mail to: Client.all.pluck(:email)
	end
end
