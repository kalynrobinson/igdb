require 'spec_helper'

describe Igdb::Company do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:company) { VCR.use_cassette('company/find') { subject.find 1 } }

    it 'returns a company' do
      expect(company).to be_a Igdb::Company
    end
  end
end
