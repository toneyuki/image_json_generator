require "test_helper"

class PresetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get presets_index_url
    assert_response :success
  end

  test "should get show" do
    get presets_show_url
    assert_response :success
  end

  test "should get new" do
    get presets_new_url
    assert_response :success
  end

  test "should get edit" do
    get presets_edit_url
    assert_response :success
  end
end
