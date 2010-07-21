require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  test "should get vote_up" do
    get :vote_up
    assert_response :success
  end

  test "should get vote_down" do
    get :vote_down
    assert_response :success
  end

end
