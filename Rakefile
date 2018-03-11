require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

namespace :spec do
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = 'spec/mailgun/**/*_spec.rb'
  end

  namespace :integration do
    %i[sinatra rack].each do |app|
      RSpec::Core::RakeTask.new(app) do |t|
        t.pattern = "spec/integration/#{app}/*_spec.rb"
      end
    end
  end
end

task default: 'spec:unit'

# bundle exec appraisal sinatra rake spec:integration:sinatra
# bundle exec appraisal rack rake spec:integration:rack
