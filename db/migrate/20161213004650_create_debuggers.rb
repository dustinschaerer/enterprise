class CreateDebuggers < ActiveRecord::Migration[5.0]
  def change
    create_table :debuggers do |t|
      t.string :name
      t.text :description
      t.references :ruby_version, foreign_key: true
      t.references :puppet_version, foreign_key: true

      t.timestamps
    end
  end
end
