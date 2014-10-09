module DaFace
  module Datasift
    class TwitterUserStatus
      attr_reader :user_id, :status

      def initialize data={}
        @user_id = data[:user][:id]
        @status = data[:status]
      end
    end
  end
end
