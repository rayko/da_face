require 'spec_helper'

describe DaFace::Twitter::User do
  describe '#new' do
    before do
      @data = DaFace::Twitter::Parser.attributes_for_twitter_user(json_fixture('twitter/simple.json')['user'])      
    end
    
    it 'creates a User object' do
      obj = DaFace::Twitter::User.new @data
      
      expect(obj.class).to eq(DaFace::Twitter::User)
    end
  end

  describe 'attributes' do
    before do
      @data = DaFace::Twitter::Parser.attributes_for_twitter_user(json_fixture('twitter/simple.json')['user'])      
      @user = DaFace::Twitter::User.new @data
    end

    it 'has all required attributes' do
      expect(@user.id).to                                    eq(@data[:id])
      expect(@user.id_str).to                                eq(@data[:id].to_s)
      expect(@user.created_at).to                            eq(Time.parse(@data[:created_at]))
      expect(@user.favourites_count).to                      eq(@data[:favourites_count])
      expect(@user.friends_count).to                         eq(@data[:friends_count])
      expect(@user.geo_enabled).to                           eq(@data[:geo_enabled])
      expect(@user.lang).to                                  eq(@data[:lang])
      expect(@user.listed_count).to                          eq(@data[:listed_count])
      expect(@user.name).to                                  eq(@data[:name])
      expect(@user.profile_image_url.kind_of?(URI)).to       eq(true)
      expect(@user.profile_image_url_https.kind_of?(URI)).to eq(true)
      expect(@user.profile_image_url).to                     eq(URI(@data[:profile_image_url]))
      expect(@user.profile_image_url_https).to               eq(URI(@data[:profile_image_url_https]))
      expect(@user.screen_name).to                           eq(@data[:screen_name])
      expect(@user.statuses_count).to                        eq(@data[:statuses_count])
      expect(@user.verified).to                              eq(@data[:verified])
    end
    
  end
end
