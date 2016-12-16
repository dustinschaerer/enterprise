class CreatePuppetModuleDebuggerAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :puppet_module_debugger_assignments do |t|
      t.references :puppet_module, foreign_key: true
      t.references :debugger, foreign_key: true
    end
  end
end
