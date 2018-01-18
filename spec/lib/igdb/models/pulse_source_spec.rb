require 'spec_helper'

describe Igdb::PulseSource do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:pulse_source) { VCR.use_cassette('pulse_source/find') { subject.find 1 } }

    it 'returns a pulse source' do
      expect(pulse_source).to be_a Igdb::PulseSource
    end
  end
end
