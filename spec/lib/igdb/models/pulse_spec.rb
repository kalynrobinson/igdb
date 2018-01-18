require 'spec_helper'

describe Igdb::Pulse do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:pulse) { VCR.use_cassette('pulse/find') { subject.find 142_583 } }

    it 'returns a pulse' do
      expect(pulse).to be_a Igdb::Pulse
    end
  end
end
