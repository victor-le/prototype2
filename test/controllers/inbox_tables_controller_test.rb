require 'test_helper'

class InboxTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inbox_table = inbox_tables(:one)
  end

  test "should get index" do
    get inbox_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_inbox_table_url
    assert_response :success
  end

  test "should create inbox_table" do
    assert_difference('InboxTable.count') do
      post inbox_tables_url, params: { inbox_table: {  } }
    end

    assert_redirected_to inbox_table_url(InboxTable.last)
  end

  test "should show inbox_table" do
    get inbox_table_url(@inbox_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_inbox_table_url(@inbox_table)
    assert_response :success
  end

  test "should update inbox_table" do
    patch inbox_table_url(@inbox_table), params: { inbox_table: {  } }
    assert_redirected_to inbox_table_url(@inbox_table)
  end

  test "should destroy inbox_table" do
    assert_difference('InboxTable.count', -1) do
      delete inbox_table_url(@inbox_table)
    end

    assert_redirected_to inbox_tables_url
  end
end
