require 'spec_helper'

RSpec.describe RequestTweets do
  describe '.execute' do
    subject { RequestTweets.execute }

    before do
      http = double
      allow(Net::HTTP).to receive(:start).and_yield http
      allow(http).to receive(:request).and_return(response)
    end

    context 'when response has http error' do
      let(:response) { double(code: '401', body: 'Unauthorized') }
      
      it { expect(subject.code).to eq '401' }
      it { expect(subject.data).to eq 'Unauthorized' }
    end

    context 'when response is successful' do
      let(:response) { double(code: '200', body: '{"statuses":["body"]}') }
      
      it { expect(subject.code).to eq '200' }
      it { expect(subject.data).to eq ['body'] }
    end
  end
end
