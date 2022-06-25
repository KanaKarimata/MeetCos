require "test_helper"

class Public::ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_contacts_show_url
    assert_response :success
  end
end
