require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "avatar" do
    @user = User.new
    @user.name = "George"
    @user.save!

    assert_equal false, @user.avatar?

    # set avatar
    @user.avatar = File.open("#{Rails.root}/test/files/lion-30-x-30.jpg")
    @user.save!

    assert_equal true, @user.avatar?

    # remove image
    @user.remove_avatar!
    @user.save!

    assert_equal false, @user.avatar?

    # add another one
    @user.avatar = File.open("#{Rails.root}/test/files/lion-2-30-x-30.jpg")
    @user.save!

    assert_equal true, @user.avatar?
  end
end
