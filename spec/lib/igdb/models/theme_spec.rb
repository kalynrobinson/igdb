require 'spec_helper'

describe Igdb::Theme do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:theme) { VCR.use_cassette('theme/find') { subject.find 1 } }

    it 'returns a theme' do
      expect(theme).to be_a Igdb::Theme
    end
  end
end
