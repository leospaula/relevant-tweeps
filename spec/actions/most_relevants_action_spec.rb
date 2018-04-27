require 'spec_helper'

RSpec.describe MostRelevantsAction do
  describe '.execute' do
    subject { MostRelevantsAction.execute }
    
    before do
      allow(RequestTweets).to receive(:execute).and_return(response)
    end

    context 'when requested tweets has http error' do
      let(:response) { double(code: '401', data: 'Unauthorized') }

      it { expect(subject).to eq response }
    end

    context 'when request tweets was successful' do
      let(:response) { double(code: '200', data: TweetsSupport.tweets) }

      it { expect(subject.code).to eq '200' }
      it { expect(subject.data).to eq MostRelevantsActionSupport.response }
    end
  end
end
