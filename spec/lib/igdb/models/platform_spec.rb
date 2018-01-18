require 'spec_helper'

describe Igdb::Platform do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:platform) { VCR.use_cassette('platform/find') { subject.find 3 } }

    it 'returns a platform' do
      expect(platform).to be_a Igdb::Platform
    end
  end
end
