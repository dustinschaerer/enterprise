require 'test_helper'

class PuppetVersionTest < ActiveSupport::TestCase

  test 'is not valid without a version' do
    puppet_version = PuppetVersion.new()
    assert puppet_version.invalid?
    assert puppet_version.errors[:version].any?
  end

  test 'is not valid without a unique version' do
    puppet_version = PuppetVersion.new(version: puppet_versions(:puppet_version_four_nine).version)
    assert puppet_version.invalid?
    assert puppet_version.errors[:version].any?
  end

end
