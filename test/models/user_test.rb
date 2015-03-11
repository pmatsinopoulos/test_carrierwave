require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "avatar" do
    @user = User.new
    @user.name = "George"
    @user.save!

    assert_equal false, @user.avatar?

    file_name = "#{Rails.root}/test/files/lion-30-x-30.jpg"

    # set avatar
    File.open(file_name) do |file|
      @user.avatar = file
    end

    @user.save!

    assert_equal true, @user.avatar?

    # remove image
    @user.remove_avatar!
    @user.save!

    assert_equal false, @user.avatar?

    # add back again
    @user = User.find @user

    File.open(file_name) do |file|
      @user.avatar = file
    end

    @user.save!

    assert_equal true, @user.avatar?
  end
end
