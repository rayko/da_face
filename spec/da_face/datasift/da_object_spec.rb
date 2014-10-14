require 'spec_helper'

describe DaFace::Datasift::DaObject do
  before do
    @parser = DaFace::Datasift::Parser.new
    @fixture = json_fixture('interactions/simple.json')
    @interaction_data = @parser.symbolize_keys(@fixture.keys, @fixture)
  end

  describe '#new' do
    it 'creates a DaObject object' do
      obj = DaFace::Datasift::DaObject.new @interaction_data, @fixture

      expect(obj.class).to eq(DaFace::Datasift::DaObject)
    end

    it 'creates empty DaObject' do
      expect(Proc.new{DaFace::Datasift::DaObject.new}).not_to raise_error
    end
  end

  describe 'attributes' do
    before do 
      @da_object = DaFace::Datasift::DaObject.new @interaction_data, @fixture
    end

    describe 'raw' do
      it 'is present' do
        expect(@da_object.raw).not_to eq(nil)
      end

      it 'has string keys' do
        expect(@da_object.raw.keys.map(&:class).uniq.size).to eq(1)
        expect(@da_object.raw.keys.map(&:class).uniq.first).to eq(String)
      end
    end
    
    describe '#interaction' do
      it 'is present' do
        expect(@da_object.interaction).not_to eq(nil)
      end
    end

    describe '#demographic' do
      it 'is present' do
        expect(@da_object.demographic).not_to eq(nil)
      end
    end

    describe '#salience' do
      it 'is present' do
        expect(@da_object.salience).not_to eq(nil)
      end
    end

    describe '#links' do
      it 'is present' do
        expect(@da_object.links).not_to eq(nil)
      end
    end
    
    describe '#twitter' do
      it 'is present' do
        expect(@da_object.twitter).not_to eq(nil)
      end
    end

    describe '#language' do
      it 'is present' do
        expect(@da_object.language).not_to eq(nil)
      end
    end

    describe '#kind' do
      it 'is present' do
        expect(@da_object.kind).to eq(DaFace::Datasift::DaObject::TWITTER_INTERACTION)
      end
    end

    describe '#twitter_interaction?' do
      it 'is present' do
        expect(@da_object.twitter_interaction?).not_to eq(nil)
      end

      it 'is true for a twitter interaction' do
        expect(@da_object.twitter_interaction?).to eq(true)
      end
    end

    describe '#notification?' do
      it 'is present' do
        expect(@da_object.notification?).not_to eq(nil)
      end

      it 'is false for a twitter interaction' do
        expect(@da_object.notification?).to eq(false)
      end
    end

    describe '#twitter_delete_notification?' do
      it 'is present' do
        expect(@da_object.twitter_delete_notification?).not_to eq(nil)
      end

      it 'is false for a twitter interaction' do
        expect(@da_object.twitter_delete_notification?).to eq(false)
      end
    end

    describe '#twitter_user_status?' do
      it 'is present' do
        expect(@da_object.twitter_user_status?).not_to eq(nil)
      end

      it 'is false for a twitter interaction' do
        expect(@da_object.twitter_user_status?).to eq(false)
      end
    end
  end




  context 'suspend message' do
    before do
      fixture = json_fixture('notifications/user_suspend.json')
      @data = @parser.symbolize_keys(fixture.keys, fixture)
      @da_object = DaFace::Datasift::DaObject.new @data
    end

    it 'creates a twitter user status message' do
      expect(@da_object.twitter.class).to eq(DaFace::Datasift::TwitterUserStatus)
      expect(@da_object.kind).to eq(DaFace::Datasift::DaObject::TWITTER_USER_NOTIFICATION)
    end

    it 'has proper status value' do
      expect(@da_object.twitter.status).to eq(DaFace::Datasift::TwitterUserStatus::STATUS_SUSPEND)
    end

    describe '#twitter_interaction?' do
      it 'is present' do
        expect(@da_object.twitter_interaction?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.twitter_interaction?).to eq(false)
      end
    end

    describe '#notification?' do
      it 'is present' do
        expect(@da_object.notification?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.notification?).to eq(true)
      end
    end

    describe '#twitter_delete_notification?' do
      it 'is present' do
        expect(@da_object.twitter_delete_notification?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.twitter_delete_notification?).to eq(false)
      end
    end

    describe '#twitter_user_status?' do
      it 'is present' do
        expect(@da_object.twitter_user_status?).not_to eq(nil)
      end

      it 'is true for a twitter user status' do
        expect(@da_object.twitter_user_status?).to eq(true)
      end
    end
    
  end

  context 'unsuspend message' do
    before do
      fixture = json_fixture('notifications/user_unsuspend.json')
      @data = @parser.symbolize_keys(fixture.keys, fixture)
      @da_object = DaFace::Datasift::DaObject.new @data
    end

    it 'creates a twitter user status message' do
      expect(@da_object.twitter.class).to eq(DaFace::Datasift::TwitterUserStatus)
      expect(@da_object.kind).to eq(DaFace::Datasift::DaObject::TWITTER_USER_NOTIFICATION)
    end

    it 'has proper status value' do
      expect(@da_object.twitter.status).to eq(DaFace::Datasift::TwitterUserStatus::STATUS_UNSUSPEND)
    end

    describe '#twitter_interaction?' do
      it 'is present' do
        expect(@da_object.twitter_interaction?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.twitter_interaction?).to eq(false)
      end
    end

    describe '#notification?' do
      it 'is present' do
        expect(@da_object.notification?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.notification?).to eq(true)
      end
    end

    describe '#twitter_delete_notification?' do
      it 'is present' do
        expect(@da_object.twitter_delete_notification?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.twitter_delete_notification?).to eq(false)
      end
    end

    describe '#twitter_user_status?' do
      it 'is present' do
        expect(@da_object.twitter_user_status?).not_to eq(nil)
      end

      it 'is true for a twitter user status' do
        expect(@da_object.twitter_user_status?).to eq(true)
      end
    end


  end


  context 'delete user message' do
    before do
      fixture = json_fixture('notifications/user_delete.json')
      @data = @parser.symbolize_keys(fixture.keys, fixture)
      @da_object = DaFace::Datasift::DaObject.new @data
    end

    it 'creates a twitter user status message' do
      expect(@da_object.twitter.class).to eq(DaFace::Datasift::TwitterUserStatus)
      expect(@da_object.kind).to eq(DaFace::Datasift::DaObject::TWITTER_USER_NOTIFICATION)
    end

    it 'has proper status value' do
      expect(@da_object.twitter.status).to eq(DaFace::Datasift::TwitterUserStatus::STATUS_DELETE)
    end

    describe '#twitter_interaction?' do
      it 'is present' do
        expect(@da_object.twitter_interaction?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.twitter_interaction?).to eq(false)
      end
    end

    describe '#notification?' do
      it 'is present' do
        expect(@da_object.notification?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.notification?).to eq(true)
      end
    end

    describe '#twitter_delete_notification?' do
      it 'is present' do
        expect(@da_object.twitter_delete_notification?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.twitter_delete_notification?).to eq(false)
      end
    end

    describe '#twitter_user_status?' do
      it 'is present' do
        expect(@da_object.twitter_user_status?).not_to eq(nil)
      end

      it 'is true for a twitter user status' do
        expect(@da_object.twitter_user_status?).to eq(true)
      end
    end

  end

  context 'undelete message' do
    before do
      fixture = json_fixture('notifications/user_undelete.json')
      @data = @parser.symbolize_keys(fixture.keys, fixture)
      @da_object = DaFace::Datasift::DaObject.new @data
    end

    it 'creates a twitter user status message' do
      expect(@da_object.twitter.class).to eq(DaFace::Datasift::TwitterUserStatus)
      expect(@da_object.kind).to eq(DaFace::Datasift::DaObject::TWITTER_USER_NOTIFICATION)
    end

    it 'has proper status value' do
      expect(@da_object.twitter.status).to eq(DaFace::Datasift::TwitterUserStatus::STATUS_UNDELETE)
    end

    describe '#twitter_interaction?' do
      it 'is present' do
        expect(@da_object.twitter_interaction?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.twitter_interaction?).to eq(false)
      end
    end

    describe '#notification?' do
      it 'is present' do
        expect(@da_object.notification?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.notification?).to eq(true)
      end
    end

    describe '#twitter_delete_notification?' do
      it 'is present' do
        expect(@da_object.twitter_delete_notification?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.twitter_delete_notification?).to eq(false)
      end
    end

    describe '#twitter_user_status?' do
      it 'is present' do
        expect(@da_object.twitter_user_status?).not_to eq(nil)
      end

      it 'is true for a twitter user status' do
        expect(@da_object.twitter_user_status?).to eq(true)
      end
    end

  end

  context 'protect message' do
    before do
      fixture = json_fixture('notifications/user_protect.json')
      @data = @parser.symbolize_keys(fixture.keys, fixture)
      @da_object = DaFace::Datasift::DaObject.new @data
    end

    it 'creates a twitter user status message' do
      expect(@da_object.twitter.class).to eq(DaFace::Datasift::TwitterUserStatus)
      expect(@da_object.kind).to eq(DaFace::Datasift::DaObject::TWITTER_USER_NOTIFICATION)
    end

    it 'has proper status value' do
      expect(@da_object.twitter.status).to eq(DaFace::Datasift::TwitterUserStatus::STATUS_PROTECT)
    end

    describe '#twitter_interaction?' do
      it 'is present' do
        expect(@da_object.twitter_interaction?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.twitter_interaction?).to eq(false)
      end
    end

    describe '#notification?' do
      it 'is present' do
        expect(@da_object.notification?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.notification?).to eq(true)
      end
    end

    describe '#twitter_delete_notification?' do
      it 'is present' do
        expect(@da_object.twitter_delete_notification?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.twitter_delete_notification?).to eq(false)
      end
    end

    describe '#twitter_user_status?' do
      it 'is present' do
        expect(@da_object.twitter_user_status?).not_to eq(nil)
      end

      it 'is true for a twitter user status' do
        expect(@da_object.twitter_user_status?).to eq(true)
      end
    end

  end

  context 'unprotect message' do
    before do
      fixture = json_fixture('notifications/user_unprotect.json')
      @data = @parser.symbolize_keys(fixture.keys, fixture)
      @da_object = DaFace::Datasift::DaObject.new @data
    end

    it 'creates a twitter user status message' do
      expect(@da_object.twitter.class).to eq(DaFace::Datasift::TwitterUserStatus)
      expect(@da_object.kind).to eq(DaFace::Datasift::DaObject::TWITTER_USER_NOTIFICATION)
    end

    it 'has proper status value' do
      expect(@da_object.twitter.status).to eq(DaFace::Datasift::TwitterUserStatus::STATUS_UNPROTECT)
    end

    describe '#twitter_interaction?' do
      it 'is present' do
        expect(@da_object.twitter_interaction?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.twitter_interaction?).to eq(false)
      end
    end

    describe '#notification?' do
      it 'is present' do
        expect(@da_object.notification?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.notification?).to eq(true)
      end
    end

    describe '#twitter_delete_notification?' do
      it 'is present' do
        expect(@da_object.twitter_delete_notification?).not_to eq(nil)
      end

      it 'is false for a twitter user status' do
        expect(@da_object.twitter_delete_notification?).to eq(false)
      end
    end

    describe '#twitter_user_status?' do
      it 'is present' do
        expect(@da_object.twitter_user_status?).not_to eq(nil)
      end

      it 'is true for a twitter user status' do
        expect(@da_object.twitter_user_status?).to eq(true)
      end
    end

  end



  context 'delete message' do
    before do
      fixture = json_fixture('notifications/delete.json')
      @data = @parser.symbolize_keys(fixture.keys, fixture)
      @da_object = DaFace::Datasift::DaObject.new @data
    end

    it 'creates a twitter delete message' do
      expect(@da_object.twitter.class).to eq(DaFace::Datasift::TwitterDeleteNotification)
      expect(@da_object.kind).to eq(DaFace::Datasift::DaObject::TWITTER_DELETE_NOTIFICATION)
    end

    describe '#twitter_interaction?' do
      it 'is present' do
        expect(@da_object.twitter_interaction?).not_to eq(nil)
      end

      it 'is false for a twitter delete message' do
        expect(@da_object.twitter_interaction?).to eq(false)
      end
    end

    describe '#notification?' do
      it 'is present' do
        expect(@da_object.notification?).not_to eq(nil)
      end

      it 'is false for a twitter delete message' do
        expect(@da_object.notification?).to eq(true)
      end
    end

    describe '#twitter_delete_notification?' do
      it 'is present' do
        expect(@da_object.twitter_delete_notification?).not_to eq(nil)
      end

      it 'is false for a twitter delete message' do
        expect(@da_object.twitter_delete_notification?).to eq(true)
      end
    end

    describe '#twitter_user_status?' do
      it 'is present' do
        expect(@da_object.twitter_user_status?).not_to eq(nil)
      end

      it 'is true for a twitter delete message' do
        expect(@da_object.twitter_user_status?).to eq(false)
      end
    end

  end

end
