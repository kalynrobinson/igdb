require 'spec_helper'

describe Igdb::Game do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:game) { VCR.use_cassette('game/find') { subject.find 1 } }

    it 'returns a game' do
      expect(game).to be_a Igdb::Game
    end
  end
end
