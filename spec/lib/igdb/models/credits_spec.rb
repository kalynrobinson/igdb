require 'spec_helper'

describe Igdb::Credits do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:credits) { VCR.use_cassette('credits/find') { subject.find 1_342_178_449 } }

    it 'returns a credits' do
      expect(credits).to be_a Igdb::Credits
    end
  end
end
