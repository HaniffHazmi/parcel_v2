require "test_helper"

class Staff::DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staff_dashboards_index_url
    assert_response :success
  end
end
