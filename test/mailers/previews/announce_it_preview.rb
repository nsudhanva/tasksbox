# Preview all emails at http://localhost:3000/rails/mailers/announce_it
class AnnounceItPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/announce_it/announce
  def announce
    AnnounceIt.announce
  end

end
