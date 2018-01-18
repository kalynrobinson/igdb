require 'spec_helper'

describe Igdb::ApiResource do
  subject { Igdb::Game }

  before { Igdb.connect }

  context 'public class methods' do
    context 'responds to its methods' do
      it { expect(subject).to respond_to(:count) }
      it { expect(subject).to respond_to(:meta) }
      it { expect(subject).to respond_to(:find) }
      it { expect(subject).to respond_to(:select) }
      it { expect(subject).to respond_to(:all) }
    end

    context 'executes methods correctly' do
      describe '.count' do
        let(:count) { VCR.use_cassette('resource/count') { subject.count } }

        it 'returns the number of resources in the database' do
          expect(count).to be_a Integer
        end
      end

      describe '.meta' do
        let(:meta) { VCR.use_cassette('resource/meta') { subject.meta } }

        it 'returns the fields of a resource' do
          expect(meta).to be_a Array
        end
      end

      describe '.find' do
        let(:find)         { VCR.use_cassette('resource/find')         { subject.find 2000     } }
        let(:find_by_slug) { VCR.use_cassette('resource/find-by-slug') { subject.find 'postal' } }

        it 'returns the correct resource' do
          expect(find.name).to eq 'Postal'
          expect(find_by_slug.id).to eq 2000
        end
      end

      describe '.select' do
        let(:select) { VCR.use_cassette('resource/select') { subject.select 1, 2, 3 } }

        it 'returns a selection of resources' do
          expect(select).to be_a Array
          expect(select).not_to be_empty
          expect(select.size).to eq 3
        end

        it 'returns the correct resources' do
          expect(select[0].name).to eq 'Thief II: The Metal Age'
          expect(select[1].name).to eq 'Thief: The Dark Project'
          expect(select[2].name).to eq 'Thief: Deadly Shadows'
        end
      end

      describe '.all' do
        let(:all)            { VCR.use_cassette('resource/all')       { subject.all          } }
        let(:all_with_limit) { VCR.use_cassette('resource/all-limit') { subject.all limit: 5 } }

        it 'returns a list of resources' do
          expect(all).to be_a Array
          expect(all.size).to eq 50
        end

        it 'returns a limit' do
          expect(all_with_limit).to be_a Array
          expect(all_with_limit.size).to eq 5
        end
      end
    end
  end
end
