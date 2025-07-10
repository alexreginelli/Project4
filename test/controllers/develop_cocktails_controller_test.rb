require "test_helper"

class DevelopCocktailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get develop_cocktails_new_url
    assert_response :success
  end

  test "should get create" do
    get develop_cocktails_create_url
    assert_response :success
  end

  test "should get index" do
    get develop_cocktails_index_url
    assert_response :success
  end

  test "should get show" do
    get develop_cocktails_show_url
    assert_response :success
  end
end
