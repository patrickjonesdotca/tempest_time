require_relative '../request'
require_relative '../responses/get_user_schedule'

module TempoAPI
  module Requests
    class GetUserSchedule < TempoAPI::Request
      attr_reader :start_date, :end_date

      def initialize(start_date:, end_date:, requested_user:)
        super
        @start_date = start_date
        @end_date = end_date || start_date
        @requested_user = requested_user || user
      end

      private

      attr_reader :requested_user

      def request_method
        'get'
      end

      def request_path
        "/user-schedule/#{requested_user}"
      end

      def query_params
        {
          "from": start_date.strftime(DATE_FORMAT),
          "to": end_date.strftime(DATE_FORMAT),
        }
      end

      def response_klass
        TempoAPI::Responses::GetUserSchedule
      end
    end
  end
end
