class PuppetModuleDebuggerAssignment < ApplicationRecord
  belongs_to :puppet_module
  belongs_to :debugger
end