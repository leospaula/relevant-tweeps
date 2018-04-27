require 'spec_helper'

RSpec.describe User do
  describe '#to_json' do
    subject { Tweet.new(tweet).to_json }

    let(:tweet) { TweetSupport.tweet }

    let(:expected) do
      {
        "id"=>643405,
        "created_at"=>"Mon Sep 24 03:35:21 +0000 2012",
        "text"=>"Try to connect the SAS circuit, maybe it will hack the online card!",
        "link"=>"https://twitter.com/orpha_bechtelar/status/643405",
        "retweet_count"=>0,
        "favorite_count"=>320,
        "favorited"=>true,
        "retweeted"=>true,
        "lang"=>nil,
        "in_reply_to_user_id"=>nil,
        "user"=>
          {
            "id"=>227690,
            "name"=>"Orpha Bechtelar",
            "screen_name"=>"orpha_bechtelar",
            "location"=>"LA, CA",
            "description"=>"Born 330 Live 310",
            "followers_count"=>58,
            "friends_count"=>58,
            "listed_count"=>2,
            "favourites_count"=>17,
            "verified"=>false,
            "profile_link"=>"https://twitter.com/orpha_bechtelar"
          },
        "user_mentions"=>[]
      }
    end

    it { expect(subject).to eq expected }
  end
end
