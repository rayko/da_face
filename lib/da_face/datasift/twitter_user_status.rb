module DaFace
  module Datasift
    class TwitterUserStatus
      STATUS_PROTECT   = :user_protect
      STATUS_UNPROTECT = :user_unprotect
      STATUS_SUSPEND   = :user_suspend
      STATUS_UNSUSPEND = :user_unsuspend
      STATUS_DELETE    = :user_delete
      STATUS_UNDELETE  = :user_undelete

      attr_reader :user_id, :status

      def initialize data={}
        @user_id = data[:user][:id]
        set_status! data[:status]
      end

      private
      def set_status! status
        case status
        when 'user_protect'
          @status = STATUS_PROTECT
        when 'user_unprotect'
          @status = STATUS_UNPROTECT
        when 'user_suspend'
          @status = STATUS_SUSPEND
        when 'user_unsuspend'
          @status = STATUS_UNSUSPEND
        when 'user_delete'
          @status = STATUS_DELETE
        when 'user_undelete'
          @status = STATUS_UNDELETE
        end
      end
    end
  end
end
