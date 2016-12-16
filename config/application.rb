require_relative 'boot'

require 'rails/all'
require 'puppet_forge'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EnterpriseWebapp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.orm             :active_record
      g.template_engine :haml
      g.test_framework  :test_unit, fixture: true
    end

    config.autoload_paths << "#{Rails.root}/lib"
    config.eager_load_paths << "#{Rails.root}/lib"

  end
end
