require "application_system_test_case"

class CommunityParticipantsTest < ApplicationSystemTestCase
  setup do
    @community_participant = community_participants(:one)
  end

  test "visiting the index" do
    visit community_participants_url
    assert_selector "h1", text: "Community participants"
  end

  test "should create community participant" do
    visit community_participants_url
    click_on "New community participant"

    fill_in "Community", with: @community_participant.community_id
    fill_in "Role", with: @community_participant.role
    fill_in "User", with: @community_participant.user_id
    click_on "Create Community participant"

    assert_text "Community participant was successfully created"
    click_on "Back"
  end

  test "should update Community participant" do
    visit community_participant_url(@community_participant)
    click_on "Edit this community participant", match: :first

    fill_in "Community", with: @community_participant.community_id
    fill_in "Role", with: @community_participant.role
    fill_in "User", with: @community_participant.user_id
    click_on "Update Community participant"

    assert_text "Community participant was successfully updated"
    click_on "Back"
  end

  test "should destroy Community participant" do
    visit community_participant_url(@community_participant)
    click_on "Destroy this community participant", match: :first

    assert_text "Community participant was successfully destroyed"
  end
end
