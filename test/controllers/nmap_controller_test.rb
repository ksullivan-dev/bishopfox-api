require 'test_helper'

class NmapControllerTest < ActionDispatch::IntegrationTest
  test "should get import" do
    get nmap_import_url
    assert_response :success
  end

end
