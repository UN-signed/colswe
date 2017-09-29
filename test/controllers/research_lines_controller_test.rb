require 'test_helper'

class ResearchLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @research_line = research_lines(:one)
  end

  test "should get index" do
    get research_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_research_line_url
    assert_response :success
  end

  test "should create research_line" do
    assert_difference('ResearchLine.count') do
      post research_lines_url, params: { research_line: { description: @research_line.description, name: @research_line.name } }
    end

    assert_redirected_to research_line_url(ResearchLine.last)
  end

  test "should show research_line" do
    get research_line_url(@research_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_research_line_url(@research_line)
    assert_response :success
  end

  test "should update research_line" do
    patch research_line_url(@research_line), params: { research_line: { description: @research_line.description, name: @research_line.name } }
    assert_redirected_to research_line_url(@research_line)
  end

  test "should destroy research_line" do
    assert_difference('ResearchLine.count', -1) do
      delete research_line_url(@research_line)
    end

    assert_redirected_to research_lines_url
  end
end
