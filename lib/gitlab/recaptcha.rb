module Gitlab
  module Recaptcha
    extend Gitlab::CurrentSettings

    def self.load_configurations!
      if current_application_settings.recaptcha_enabled
        ::Recaptcha.configure do |config|
          config.public_key  = current_application_settings.recaptcha_site_key
          config.private_key = current_application_settings.recaptcha_private_key
        end

        true
      end
    end

    def self.enabled?
      current_application_settings.recaptcha_enabled
    end
  end
end
