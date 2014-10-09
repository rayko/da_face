require 'spec_helper'

describe DaFace::Datasift::TwitterUserStatus do
  before do
    @parser = DaFace::Datasift::Parser.new
    fixture = json_fixture('notifications/user_suspend.json')['twitter']
    @user_suspended = @parser.symbolize_keys(fixture.keys, fixture)
  end

  describe '#new' do
    it 'creates a twitter user status notification' do
      obj = DaFace::Datasift::TwitterUserStatus.new @user_suspended

      expect(obj.class).to eq(DaFace::Datasift::TwitterUserStatus)
    end
  end

  describe 'attributes' do
    before do
      @status = DaFace::Datasift::TwitterUserStatus.new @user_suspended
    end

    describe '#user_id' do
      it 'is present' do
        expect(@status.user_id).to eq(@user_suspended[:user][:id])
      end
    end

    describe '#status' do
      it 'is present' do
        expect(@status.status).to eq(DaFace::Datasift::TwitterUserStatus::STATUS_SUSPEND)
      end
    end
  end
    
end
