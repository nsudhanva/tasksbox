require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "completed" do
    mail = Notification.completed
    assert_equal "Completed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
