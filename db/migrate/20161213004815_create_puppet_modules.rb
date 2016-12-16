class CreatePuppetModules < ActiveRecord::Migration[5.0]
  def change
    create_table :puppet_modules do |t|
      t.string :name
      t.string :slug
      t.string :uri
      t.integer :downloads
      t.boolean :supported
      t.string :homepage_url
      t.string :owner
      t.string :current_release_version
      t.string :release_supported


      t.timestamps
    end
  end
end
