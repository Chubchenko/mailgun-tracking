# frozen_string_literal: true

if defined?(::Rails)
  require 'dummy/rails/application'

  RSpec.describe 'Rails', type: :integration do
    it_behaves_like 'acts as rack'
  end
end
