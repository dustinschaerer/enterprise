class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
