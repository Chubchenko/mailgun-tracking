require 'spec_helper'

RSpec.describe Mailgun::Tracking do
  it 'has a version number' do
    expect(Mailgun::Tracking::VERSION).not_to be nil
  end
end
