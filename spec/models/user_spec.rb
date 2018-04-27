require 'spec_helper'
require 'json'

RSpec.describe User do
  describe '#to_json' do
    subject { User.new(user).to_json }

    let(:user) { UserSupport.user }

    let(:expected) do
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
      }
    end

    it { expect(subject).to eq expected }
  end
end
