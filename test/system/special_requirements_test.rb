require "application_system_test_case"

class SpecialRequirementsTest < ApplicationSystemTestCase
  setup do
    @special_requirement = special_requirements(:one)
  end

  test "visiting the index" do
    visit special_requirements_url
    assert_selector "h1", text: "Special Requirements"
  end

  test "creating a Special requirement" do
    visit special_requirements_url
    click_on "New Special Requirement"

    fill_in "Requirementdesc", with: @special_requirement.requirementDesc
    fill_in "Requirementvalue", with: @special_requirement.requirementValue
    click_on "Create Special requirement"

    assert_text "Special requirement was successfully created"
    click_on "Back"
  end

  test "updating a Special requirement" do
    visit special_requirements_url
    click_on "Edit", match: :first

    fill_in "Requirementdesc", with: @special_requirement.requirementDesc
    fill_in "Requirementvalue", with: @special_requirement.requirementValue
    click_on "Update Special requirement"

    assert_text "Special requirement was successfully updated"
    click_on "Back"
  end

  test "destroying a Special requirement" do
    visit special_requirements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Special requirement was successfully destroyed"
  end
end
