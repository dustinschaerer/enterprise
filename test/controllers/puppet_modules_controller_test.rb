# require 'test_helper'

# class PuppetModulesControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @puppet_module = puppet_modules(:one)
#   end

#   test "should get index" do
#     get puppet_modules_url
#     assert_response :success
#   end

#   test "should get new" do
#     get new_puppet_module_url
#     assert_response :success
#   end

#   test "should create puppet_module" do
#     assert_difference('PuppetModule.count') do
#       post puppet_modules_url, params: { puppet_module: { name: @puppet_module.name, owner: @puppet_module.owner, slug: @puppet_module.slug, uri: @puppet_module.uri, version: @puppet_module.version, version_release_date: @puppet_module.version_release_date } }
#     end

#     assert_redirected_to puppet_module_url(PuppetModule.last)
#   end

#   test "should show puppet_module" do
#     get puppet_module_url(@puppet_module)
#     assert_response :success
#   end

#   test "should get edit" do
#     get edit_puppet_module_url(@puppet_module)
#     assert_response :success
#   end

#   test "should update puppet_module" do
#     patch puppet_module_url(@puppet_module), params: { puppet_module: { name: @puppet_module.name, owner: @puppet_module.owner, slug: @puppet_module.slug, uri: @puppet_module.uri, version: @puppet_module.version, version_release_date: @puppet_module.version_release_date } }
#     assert_redirected_to puppet_module_url(@puppet_module)
#   end

#   test "should destroy puppet_module" do
#     assert_difference('PuppetModule.count', -1) do
#       delete puppet_module_url(@puppet_module)
#     end

#     assert_redirected_to puppet_modules_url
#   end
# end
