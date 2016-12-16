class PuppetModule < ApplicationRecord
  has_many :puppet_module_debugger_assignments, dependent: :delete_all
  has_many :debuggers, through: :puppet_module_debugger_assignments
end
