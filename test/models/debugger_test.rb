require 'test_helper'

class DebuggerTest < ActiveSupport::TestCase

  setup do
    @debugger = debuggers(:debugger_one)
  end

  test 'debugger is not valid without a unique name' do
    debugger = Debugger.new( name: debuggers(:debugger_one).name,
                             ruby_version: @debugger.ruby_version,
                             puppet_version: @debugger.puppet_version,
                             description: @debugger.description )
    assert debugger.invalid?
    assert debugger.errors[:name].any?
  end

  test 'debugger is not valid without a name' do
    debugger = Debugger.new( ruby_version: @debugger.ruby_version,
                             puppet_version: @debugger.puppet_version,
                             description: @debugger.description )
    assert debugger.invalid?
    assert debugger.errors[:name].any?
  end

  test 'debugger is not valid without a ruby_version' do
    debugger = Debugger.new( name: "Killer Name",
                             puppet_version: @debugger.puppet_version,
                             description: @debugger.description )
    assert debugger.invalid?
    assert debugger.errors[:ruby_version].any?
  end

   test 'debugger is not valid without a puppet_version' do
    debugger = Debugger.new( name: "Killer Name",
                             ruby_version: @debugger.ruby_version,
                             description: @debugger.description )
    assert debugger.invalid?
    assert debugger.errors[:puppet_version].any?
  end

end