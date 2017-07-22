module Mailgun
  module Tracking
    class Railtie < Rails::Railtie
      initializer 'mailgun-tracking.insert_middleware' do |app|
        app.config.middleware.use(Mailgun::Tracking::Middleware)
      end
    end
  end
end
