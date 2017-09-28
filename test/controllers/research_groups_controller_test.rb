require 'test_helper'

class ResearchGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @research_group = research_groups(:one)
  end

  test "should get index" do
    get research_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_research_group_url
    assert_response :success
  end

  test "should create research_group" do
    assert_difference('ResearchGroup.count') do
      post research_groups_url, params: { research_group: { administrator: @research_group.administrator, description: @research_group.description, name: @research_group.name } }
    end

    assert_redirected_to research_group_url(ResearchGroup.last)
  end

  test "should show research_group" do
    get research_group_url(@research_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_research_group_url(@research_group)
    assert_response :success
  end

  test "should update research_group" do
    patch research_group_url(@research_group), params: { research_group: { administrator: @research_group.administrator, description: @research_group.description, name: @research_group.name } }
    assert_redirected_to research_group_url(@research_group)
  end

  test "should destroy research_group" do
    assert_difference('ResearchGroup.count', -1) do
      delete research_group_url(@research_group)
    end

    assert_redirected_to research_groups_url
  end
end
