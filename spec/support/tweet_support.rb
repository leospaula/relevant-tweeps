class TweetSupport
  def self.tweet
    {
      "coordinates"=>nil,
      "favorited"=>true,
      "truncated"=>false,
      "created_at"=>"Mon Sep 24 03:35:21 +0000 2012",
      "id_str"=>"643405",
      "entities"=>{"urls"=>[], "hashtags"=>[], "user_mentions"=>[]},
      "in_reply_to_user_id_str"=>"",
      "contributors"=>nil,
      "text"=>"Try to connect the SAS circuit, maybe it will hack the online card!",
      "metadata"=>{"iso_language_code"=>"pt", "result_type"=>"recent"},
      "retweet_count"=>0,
      "in_reply_to_status_id_str"=>"",
      "id"=>643405,
      "geo"=>nil,
      "retweeted"=>true,
      "in_reply_to_user_id"=>nil,
      "place"=>nil,
      "favorite_count"=>320,
      "user"=> UserSupport.user,
      "in_reply_to_screen_name"=>"",
      "source"=>"web",
      "in_reply_to_status_id"=>nil
    }
  end
end
