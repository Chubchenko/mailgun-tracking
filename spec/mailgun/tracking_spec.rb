# frozen_string_literal: true

RSpec.describe Mailgun::Tracking do
  it { is_expected.to respond_to(:api_key) }
  it { is_expected.to respond_to(:endpoint) }
  it { is_expected.to respond_to(:api_key=) }
  it { is_expected.to respond_to(:endpoint=) }

  it do
    expect do
      described_class.non_existent_method
    end.to raise_error(NoMethodError)
  end

  it { is_expected.not_to respond_to(:non_existent_method) }

  describe '.configure' do
    before do
      allow(Mailgun::Tracking::Fanout).to receive(:on)
      allow(Mailgun::Tracking::Fanout).to receive(:all)

      described_class.configure do |config|
        config.api_key = 'dab36017-478a-4373-9378-7070eb5968b5'
        config.endpoint = '/mailgun-tracking'

        config.on('delivered', proc {})

        config.all(proc {})
      end
    end

    it 'setups api key' do
      expect(described_class.api_key).to eq('dab36017-478a-4373-9378-7070eb5968b5')
    end

    it 'setups endpoint' do
      expect(described_class.endpoint).to eq('/mailgun-tracking')
    end

    it { expect(Mailgun::Tracking::Fanout).to have_received(:on).with('delivered', instance_of(Proc)) }

    it { expect(Mailgun::Tracking::Fanout).to have_received(:all).with(instance_of(Proc)) }
  end
end
