require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rout
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', 
        headers: :any, 
        methods: %i[:get, :post, :put, :delete, :options]
      end
    end

    #config.i18n.load_path += Dir\[Rails.root.join('config/locales/\*\*/\*.{rb,yml}').to_s\] 
    #config.i18n.default_locale = :de 
    config.time_zone = 'Brasilia'
    config.active_record.default_timezone = :utc

    #I18n.load_path << Dir[File.expand_path("config/locales") + "/*.yml"]
    config.i18n.default_locale = :'pt-BR'
    #I18n.available_locales = [:en, 'pt-BR', :de, :fr]
    #config.encoding = "utf-8"
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
