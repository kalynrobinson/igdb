require 'spec_helper'

describe Igdb::GameEngine do
  subject { described_class }

  before { Igdb.connect }

  describe '.find' do
    let(:game_engine) { VCR.use_cassette('game_engine/find') { subject.find 2 } }

    it 'returns a game engine' do
      expect(game_engine).to be_a Igdb::GameEngine
    end
  end
end
