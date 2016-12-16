require 'test_helper'

class DebuggersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @debugger = debuggers(:one)
  end

  test "should get index" do
    get debuggers_url
    assert_response :success
  end

  test "should get new" do
    get new_debugger_url
    assert_response :success
  end

  test "should create debugger" do
    assert_difference('Debugger.count') do
      post debuggers_url, params: { debugger: { description: @debugger.description, name: @debugger.name, puppet_version_id: @debugger.puppet_version_id, ruby_version_id: @debugger.ruby_version_id } }
    end

    assert_redirected_to debugger_url(Debugger.last)
  end

  test "should show debugger" do
    get debugger_url(@debugger)
    assert_response :success
  end

  test "should get edit" do
    get edit_debugger_url(@debugger)
    assert_response :success
  end

  test "should update debugger" do
    patch debugger_url(@debugger), params: { debugger: { description: @debugger.description, name: @debugger.name, puppet_version_id: @debugger.puppet_version_id, ruby_version_id: @debugger.ruby_version_id } }
    assert_redirected_to debugger_url(@debugger)
  end

  test "should destroy debugger" do
    assert_difference('Debugger.count', -1) do
      delete debugger_url(@debugger)
    end

    assert_redirected_to debuggers_url
  end
end
