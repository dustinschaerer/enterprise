class CreateRubyVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :ruby_versions do |t|
      t.string :version

      t.timestamps
    end
  end
end
