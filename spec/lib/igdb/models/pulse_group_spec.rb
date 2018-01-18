require 'spec_helper'

describe Igdb::PulseGroup do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:pulse_group) { VCR.use_cassette('pulse_group/find') { subject.find 19_873 } }

    it 'returns a pulse group' do
      expect(pulse_group).to be_a Igdb::PulseGroup
    end
  end
end
