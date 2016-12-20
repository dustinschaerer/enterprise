require 'test_helper'

class PuppetModuleTest < ActiveSupport::TestCase

  test 'is not valid without a name' do
    puppet_module = PuppetModule.new()
    assert puppet_module.invalid?
    assert puppet_module.errors[:name].any?
  end

  test 'is not valid without a unique name' do
    puppet_module = PuppetModule.new(name: puppet_modules(:puppet_module_one).name)
    assert puppet_module.invalid?
    assert puppet_module.errors[:name].any?
  end

  test 'is not valid without a slug' do
    puppet_module = PuppetModule.new()
    assert puppet_module.invalid?
    assert puppet_module.errors[:slug].any?
  end

  test 'is not valid without a unique slug' do
    puppet_module = PuppetModule.new(slug: puppet_modules(:puppet_module_one).slug)
    assert puppet_module.invalid?
    assert puppet_module.errors[:slug].any?
  end

  test 'is not valid without a uri' do
    puppet_module = PuppetModule.new()
    assert puppet_module.invalid?
    assert puppet_module.errors[:uri].any?
  end

  test 'is not valid without a unique uri' do
    puppet_module = PuppetModule.new(uri: puppet_modules(:puppet_module_one).uri)
    assert puppet_module.invalid?
    assert puppet_module.errors[:uri].any?
  end

end