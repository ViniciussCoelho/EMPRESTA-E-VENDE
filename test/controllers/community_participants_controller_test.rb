require "test_helper"

class CommunityParticipantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @community_participant = community_participants(:one)
  end

  test "should get index" do
    get community_participants_url
    assert_response :success
  end

  test "should get new" do
    get new_community_participant_url
    assert_response :success
  end

  test "should create community_participant" do
    assert_difference("CommunityParticipant.count") do
      post community_participants_url, params: { community_participant: { community_id: @community_participant.community_id, role: @community_participant.role, user_id: @community_participant.user_id } }
    end

    assert_redirected_to community_participant_url(CommunityParticipant.last)
  end

  test "should show community_participant" do
    get community_participant_url(@community_participant)
    assert_response :success
  end

  test "should get edit" do
    get edit_community_participant_url(@community_participant)
    assert_response :success
  end

  test "should update community_participant" do
    patch community_participant_url(@community_participant), params: { community_participant: { community_id: @community_participant.community_id, role: @community_participant.role, user_id: @community_participant.user_id } }
    assert_redirected_to community_participant_url(@community_participant)
  end

  test "should destroy community_participant" do
    assert_difference("CommunityParticipant.count", -1) do
      delete community_participant_url(@community_participant)
    end

    assert_redirected_to community_participants_url
  end
end
