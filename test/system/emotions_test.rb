require "application_system_test_case"

class EmotionsTest < ApplicationSystemTestCase
  setup do
    @emotion = emotions(:one)
  end

  test "visiting the index" do
    visit emotions_url
    assert_selector "h1", text: "Emotions"
  end

  test "creating a Emotion" do
    visit emotions_url
    click_on "New Emotion"

    fill_in "Action", with: @emotion.action
    fill_in "Feelings", with: @emotion.feelings
    fill_in "Scale", with: @emotion.scale
    fill_in "Thought", with: @emotion.thought
    fill_in "Trigger", with: @emotion.trigger
    click_on "Create Emotion"

    assert_text "Emotion was successfully created"
    click_on "Back"
  end

  test "updating a Emotion" do
    visit emotions_url
    click_on "Edit", match: :first

    fill_in "Action", with: @emotion.action
    fill_in "Feelings", with: @emotion.feelings
    fill_in "Scale", with: @emotion.scale
    fill_in "Thought", with: @emotion.thought
    fill_in "Trigger", with: @emotion.trigger
    click_on "Update Emotion"

    assert_text "Emotion was successfully updated"
    click_on "Back"
  end

  test "destroying a Emotion" do
    visit emotions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Emotion was successfully destroyed"
  end
end
