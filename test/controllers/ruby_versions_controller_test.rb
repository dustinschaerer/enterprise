# require 'test_helper'

# class RubyVersionsControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @ruby_version = ruby_versions(:one)
#   end

#   test "should get index" do
#     get ruby_versions_url
#     assert_response :success
#   end

#   test "should get new" do
#     get new_ruby_version_url
#     assert_response :success
#   end

#   test "should create ruby_version" do
#     assert_difference('RubyVersion.count') do
#       post ruby_versions_url, params: { ruby_version: { version: @ruby_version.version } }
#     end

#     assert_redirected_to ruby_version_url(RubyVersion.last)
#   end

#   test "should show ruby_version" do
#     get ruby_version_url(@ruby_version)
#     assert_response :success
#   end

#   test "should get edit" do
#     get edit_ruby_version_url(@ruby_version)
#     assert_response :success
#   end

#   test "should update ruby_version" do
#     patch ruby_version_url(@ruby_version), params: { ruby_version: { version: @ruby_version.version } }
#     assert_redirected_to ruby_version_url(@ruby_version)
#   end

#   test "should destroy ruby_version" do
#     assert_difference('RubyVersion.count', -1) do
#       delete ruby_version_url(@ruby_version)
#     end

#     assert_redirected_to ruby_versions_url
#   end
# end
