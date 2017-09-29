require 'test_helper'

class ResearchAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @research_area = research_areas(:one)
  end

  test "should get index" do
    get research_areas_url
    assert_response :success
  end

  test "should get new" do
    get new_research_area_url
    assert_response :success
  end

  test "should create research_area" do
    assert_difference('ResearchArea.count') do
      post research_areas_url, params: { research_area: { description: @research_area.description, name: @research_area.name } }
    end

    assert_redirected_to research_area_url(ResearchArea.last)
  end

  test "should show research_area" do
    get research_area_url(@research_area)
    assert_response :success
  end

  test "should get edit" do
    get edit_research_area_url(@research_area)
    assert_response :success
  end

  test "should update research_area" do
    patch research_area_url(@research_area), params: { research_area: { description: @research_area.description, name: @research_area.name } }
    assert_redirected_to research_area_url(@research_area)
  end

  test "should destroy research_area" do
    assert_difference('ResearchArea.count', -1) do
      delete research_area_url(@research_area)
    end

    assert_redirected_to research_areas_url
  end
end
