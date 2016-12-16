# require 'test_helper'

# class PuppetVersionsControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @puppet_version = puppet_versions(:one)
#   end

#   test "should get index" do
#     get puppet_versions_url
#     assert_response :success
#   end

#   test "should get new" do
#     get new_puppet_version_url
#     assert_response :success
#   end

#   test "should create puppet_version" do
#     assert_difference('PuppetVersion.count') do
#       post puppet_versions_url, params: { puppet_version: { version: @puppet_version.version } }
#     end

#     assert_redirected_to puppet_version_url(PuppetVersion.last)
#   end

#   test "should show puppet_version" do
#     get puppet_version_url(@puppet_version)
#     assert_response :success
#   end

#   test "should get edit" do
#     get edit_puppet_version_url(@puppet_version)
#     assert_response :success
#   end

#   test "should update puppet_version" do
#     patch puppet_version_url(@puppet_version), params: { puppet_version: { version: @puppet_version.version } }
#     assert_redirected_to puppet_version_url(@puppet_version)
#   end

#   test "should destroy puppet_version" do
#     assert_difference('PuppetVersion.count', -1) do
#       delete puppet_version_url(@puppet_version)
#     end

#     assert_redirected_to puppet_versions_url
#   end
# end
