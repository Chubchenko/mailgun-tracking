require 'spec_helper'

RSpec.describe Mailgun::Tracking::Configuration do
  subject(:configuration) { described_class.instance }

  it 'always refers to the same instance' do
    expect(configuration).to eql(described_class.instance)
  end
end
