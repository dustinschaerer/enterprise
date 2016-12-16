class CreateUserDebuggerAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_debugger_assignments do |t|
      t.references :user, foreign_key: true
      t.references :debugger, foreign_key: true
    end
  end
end
