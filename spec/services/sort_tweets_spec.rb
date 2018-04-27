require 'spec_helper'

RSpec.describe SortTweets do
  describe '.execute' do
    subject { SortTweets.execute(tweets) }

    let(:tweets) do
      TweetsSupport.tweets.map { |tweet| Tweet.new(tweet) }
    end

    it { expect(subject.first.id).to eq 8 }
  end
end
