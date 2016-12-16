json.extract! session, :id, :ruby_version_id, :puppet_version_id, :name, :description, :created_at, :updated_at
json.url session_url(session, format: :json)