require "test_helper"

class CategorizesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categorize = categorizes(:one)
  end

  test "should get index" do
    get categorizes_url
    assert_response :success
  end

  test "should get new" do
    get new_categorize_url
    assert_response :success
  end

  test "should create categorize" do
    assert_difference('Categorize.count') do
      post categorizes_url, params: { categorize: { categorizable_id: @categorize.categorizable_id, categorizable_type: @categorize.categorizable_type } }
    end

    assert_redirected_to categorize_url(Categorize.last)
  end

  test "should show categorize" do
    get categorize_url(@categorize)
    assert_response :success
  end

  test "should get edit" do
    get edit_categorize_url(@categorize)
    assert_response :success
  end

  test "should update categorize" do
    patch categorize_url(@categorize), params: { categorize: { categorizable_id: @categorize.categorizable_id, categorizable_type: @categorize.categorizable_type } }
    assert_redirected_to categorize_url(@categorize)
  end

  test "should destroy categorize" do
    assert_difference('Categorize.count', -1) do
      delete categorize_url(@categorize)
    end

    assert_redirected_to categorizes_url
  end
end
