require 'spec_helper'

RSpec.describe FilterTweets do
  describe '.execute' do
    subject { FilterTweets.execute(tweets) }

    let(:tweets) do
      TweetsSupport.tweets.map { |tweet| Tweet.new(tweet) }
    end

    it { expect(tweets.count - 3).to eq subject.count }
  end
end
