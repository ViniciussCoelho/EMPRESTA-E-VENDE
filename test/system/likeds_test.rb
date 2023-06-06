require "application_system_test_case"

class LikedsTest < ApplicationSystemTestCase
  setup do
    @liked = likeds(:one)
  end

  test "visiting the index" do
    visit likeds_url
    assert_selector "h1", text: "Likeds"
  end

  test "should create liked" do
    visit likeds_url
    click_on "New liked"

    fill_in "Post", with: @liked.post_id
    fill_in "User", with: @liked.user_id
    click_on "Create Liked"

    assert_text "Liked was successfully created"
    click_on "Back"
  end

  test "should update Liked" do
    visit liked_url(@liked)
    click_on "Edit this liked", match: :first

    fill_in "Post", with: @liked.post_id
    fill_in "User", with: @liked.user_id
    click_on "Update Liked"

    assert_text "Liked was successfully updated"
    click_on "Back"
  end

  test "should destroy Liked" do
    visit liked_url(@liked)
    click_on "Destroy this liked", match: :first

    assert_text "Liked was successfully destroyed"
  end
end
