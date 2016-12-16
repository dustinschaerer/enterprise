json.extract! puppet_module, :id, :name, :version, :version_release_date, :owner, :slug, :uri, :created_at, :updated_at
json.url puppet_module_url(puppet_module, format: :json)