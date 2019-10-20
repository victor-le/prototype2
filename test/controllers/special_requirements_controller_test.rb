require 'test_helper'

class SpecialRequirementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @special_requirement = special_requirements(:one)
  end

  test "should get index" do
    get special_requirements_url
    assert_response :success
  end

  test "should get new" do
    get new_special_requirement_url
    assert_response :success
  end

  test "should create special_requirement" do
    assert_difference('SpecialRequirement.count') do
      post special_requirements_url, params: { special_requirement: { requirementDesc: @special_requirement.requirementDesc, requirementValue: @special_requirement.requirementValue } }
    end

    assert_redirected_to special_requirement_url(SpecialRequirement.last)
  end

  test "should show special_requirement" do
    get special_requirement_url(@special_requirement)
    assert_response :success
  end

  test "should get edit" do
    get edit_special_requirement_url(@special_requirement)
    assert_response :success
  end

  test "should update special_requirement" do
    patch special_requirement_url(@special_requirement), params: { special_requirement: { requirementDesc: @special_requirement.requirementDesc, requirementValue: @special_requirement.requirementValue } }
    assert_redirected_to special_requirement_url(@special_requirement)
  end

  test "should destroy special_requirement" do
    assert_difference('SpecialRequirement.count', -1) do
      delete special_requirement_url(@special_requirement)
    end

    assert_redirected_to special_requirements_url
  end
end
