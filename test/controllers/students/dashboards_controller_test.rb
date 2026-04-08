require "test_helper"

class Students::DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get students_dashboards_index_url
    assert_response :success
  end
end
