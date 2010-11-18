require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "password_reset_instructions" do
    @expected.subject = 'UserMailer#password_reset_instructions'
    @expected.body    = read_fixture('password_reset_instructions')
    @expected.date    = Time.now

    assert_equal @expected.encoded, UserMailer.create_password_reset_instructions(@expected.date).encoded
  end

end
