require "test_helper"

class JobsjsonControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jobsjson_index_url
    assert_response :success
  end
end
