require 'spec_helper'

RSpec.describe Router do
  describe '.execute' do
    subject { Router.execute(method, path) }

    context 'when method is not GET' do
      let(:method) { 'POST' }
      let(:path) { '' }

      it { expect(subject.code).to eq '404' }
    end

    context 'when method is GET' do
      let(:method) { 'GET' }

      context 'and path is not valid' do
        let(:path) { '/invalid' }

        it { expect(subject.code).to eq '404' }
      end

      context 'when path is most_relevants' do
        let(:path) { '/most_relevants' }

        before do
          allow(MostRelevantsAction).to receive(:execute).and_return(double(code: '200'))
        end

        it { expect(subject.code).to eq '200' }

        it 'calls most relevants action' do
          subject
          expect(MostRelevantsAction).to have_received(:execute)
        end
      end

      context 'when path is most_mentions' do
        let(:path) { '/most_mentions' }

        before do
          allow(MostMentionsAction).to receive(:execute).and_return(double(code: '200'))
        end

        it { expect(subject.code).to eq '200' }

        it 'calls most mentions action' do
          subject
          expect(MostMentionsAction).to have_received(:execute)
        end
      end
    end
  end
end
