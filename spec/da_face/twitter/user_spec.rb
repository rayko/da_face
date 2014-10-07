require 'spec_helper'

describe DaFace::Twitter::User do
  before do
    @parser = DaFace::Datasift::Parser.new
    fixture = json_fixture('twitter/simple.json')['user']
    @data = @parser.symbolize_keys(fixture.keys, fixture)
  end

  describe '#new' do
    it 'creates a User object' do
      obj = DaFace::Twitter::User.new @data
      
      expect(obj.class).to eq(DaFace::Twitter::User)
    end
  end

  describe 'attributes' do
    before do
      @user = DaFace::Twitter::User.new @data
    end

    describe '#id' do
      it 'is preset' do
        expect(@user.id).to eq(@data[:id])
      end
    end

    describe '#id_str' do
      it 'is present' do
        expect(@user.id_str).to eq(@data[:id].to_s)
      end
    end
    
    describe '#created_at' do
      it 'is present' do
        expect(@user.created_at).to eq(Time.parse(@data[:created_at]))
      end
    end

    describe '#favourites_count' do
      it 'is present' do
        expect(@user.favourites_count).to eq(@data[:favourites_count])
      end
    end

    describe '#friends_count' do
      it 'is present' do
        expect(@user.friends_count).to eq(@data[:friends_count])
      end
    end

    describe '#geo_enabled' do
      it 'is present' do
        expect(@user.geo_enabled).to eq(@data[:geo_enabled])
      end
    end

    describe '#lang' do
      it 'is present' do
        expect(@user.lang).to eq(@data[:lang])
      end
    end

    describe '#listed_count' do
      it 'is present' do
        expect(@user.listed_count).to eq(@data[:listed_count])
      end
    end

    describe '#name' do
      it 'is present' do
        expect(@user.name).to eq(@data[:name])
      end
    end

    describe '#profile_image_url' do
      it 'is present' do
        expect(@user.profile_image_url.kind_of?(URI)).to eq(true)
        expect(@user.profile_image_url).to eq(URI(@data[:profile_image_url]))
      end
    end

    describe '#profile_image_url_https' do
      it 'is present' do
        expect(@user.profile_image_url_https.kind_of?(URI)).to eq(true)
        expect(@user.profile_image_url_https).to eq(URI(@data[:profile_image_url_https]))
      end
    end

    describe '#screen_name' do
      it 'is present' do
        expect(@user.screen_name).to eq(@data[:screen_name])
      end
    end

    describe '#statuses_count' do
      it 'is present' do
        expect(@user.statuses_count).to eq(@data[:statuses_count])
      end
    end

    describe '#verified' do
      it 'is present' do
        expect(@user.verified).to eq(@data[:verified])
      end
    end
    
  end
end
