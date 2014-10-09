require 'spec_helper'

describe DaFace::Datasift::TwitterDeleteNotification do
  before do
    @parser = DaFace::Datasift::Parser.new
    fixture = json_fixture('notifications/delete.json')
    @delete_notification = @parser.symbolize_keys(fixture.keys, fixture)
  end

  describe '#new' do
    it 'creates a Notification object' do
      obj = DaFace::Datasift::TwitterDeleteNotification.new @delete_notification

      expect(obj.class).to eq(DaFace::Datasift::TwitterDeleteNotification)
    end

    it 'raise error when nothing is passed' do
      expect(Proc.new{DaFace::Datasift::TwitterDeleteNotification.new}).to raise_error(DaFace::Datasift::BadTwitterDeleteNotification)
    end
  end

  describe 'attributes' do
    before do
      @notification = DaFace::Datasift::TwitterDeleteNotification.new @delete_notification
    end

    describe '#interaction_id' do
      it 'is present' do
        expect(@notification.interaction_id).to eq(@delete_notification[:interaction][:id])
      end
    end

    describe '#interaction_type' do
      it 'is present' do
        expect(@notification.interaction_type).to eq(@delete_notification[:interaction][:type])
      end
    end

    describe '#tweet_id' do
      it 'is present' do
        expect(@notification.tweet_id).to eq(@delete_notification[:twitter][:id])
      end
    end
  end
end
