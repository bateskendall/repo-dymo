require 'test_helper'

class LabelsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get labels_show_url
    assert_response :success
  end

  test "should get search" do
    get labels_search_url
    assert_response :success
  end

end
