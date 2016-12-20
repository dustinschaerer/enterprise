require 'test_helper'

class RubyVersionTest < ActiveSupport::TestCase

  test 'is not valid without a version' do
    ruby_version = RubyVersion.new()
    assert ruby_version.invalid?
    assert ruby_version.errors[:version].any?
  end

  test 'is not valid without a unique version' do
    ruby_version = RubyVersion.new(version: ruby_versions(:ruby_version_one).version)
    assert ruby_version.invalid?
    assert ruby_version.errors[:version].any?
  end

end
