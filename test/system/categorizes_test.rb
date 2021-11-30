require "application_system_test_case"

class CategorizesTest < ApplicationSystemTestCase
  setup do
    @categorize = categorizes(:one)
  end

  test "visiting the index" do
    visit categorizes_url
    assert_selector "h1", text: "Categorizes"
  end

  test "creating a Categorize" do
    visit categorizes_url
    click_on "New Categorize"

    fill_in "Categorizable", with: @categorize.categorizable_id
    fill_in "Categorizable type", with: @categorize.categorizable_type
    click_on "Create Categorize"

    assert_text "Categorize was successfully created"
    click_on "Back"
  end

  test "updating a Categorize" do
    visit categorizes_url
    click_on "Edit", match: :first

    fill_in "Categorizable", with: @categorize.categorizable_id
    fill_in "Categorizable type", with: @categorize.categorizable_type
    click_on "Update Categorize"

    assert_text "Categorize was successfully updated"
    click_on "Back"
  end

  test "destroying a Categorize" do
    visit categorizes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Categorize was successfully destroyed"
  end
end
