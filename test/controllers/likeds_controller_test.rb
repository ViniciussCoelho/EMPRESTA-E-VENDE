require "test_helper"

class LikedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @liked = likeds(:one)
  end

  test "should get index" do
    get likeds_url
    assert_response :success
  end

  test "should get new" do
    get new_liked_url
    assert_response :success
  end

  test "should create liked" do
    assert_difference("Liked.count") do
      post likeds_url, params: { liked: { post_id: @liked.post_id, user_id: @liked.user_id } }
    end

    assert_redirected_to liked_url(Liked.last)
  end

  test "should show liked" do
    get liked_url(@liked)
    assert_response :success
  end

  test "should get edit" do
    get edit_liked_url(@liked)
    assert_response :success
  end

  test "should update liked" do
    patch liked_url(@liked), params: { liked: { post_id: @liked.post_id, user_id: @liked.user_id } }
    assert_redirected_to liked_url(@liked)
  end

  test "should destroy liked" do
    assert_difference("Liked.count", -1) do
      delete liked_url(@liked)
    end

    assert_redirected_to likeds_url
  end
end
