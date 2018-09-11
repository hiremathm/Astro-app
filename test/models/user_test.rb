require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not get saved without email" do 
  	user = User.new
  	#user.email ="shiva@gmail.com"
  	assert_not user.save
  end
end
