require_relative '../../spec_helper'
 
describe RubyRiot::Summoner do
  it "must work" do
    "Yay!".must_be_instance_of String
  end
 
end

describe "GET summoner by name" do
 
  before do
    VCR.insert_cassette 'summoner', :record => :new_episodes
  end
 
  after do
    VCR.eject_cassette
  end
 
  it "records the fixture" do
    Dish::Player.get("/summoner/by-name/kingles?api_key=#{RubyRiot::API_KEY}")
  end
 
end
 
