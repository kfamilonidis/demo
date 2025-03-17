module Api
  module V1
    class BaseController < ApplicationController
      before_action :authenticate_request

      private

      def authenticate_request
        token = request.headers['Authorization']&.split(' ')&.last

        if token
          decoded_token = JwtService.decode(token)

          if decoded_token
            @current_user = User.find_by(id: decoded_token[:user_id])
          else
            render json: { error: 'Invalid or expired token' }, status: :unauthorized
          end
        else
          render json: { error: 'Token missing' }, status: :unauthorized
        end
      end
    end
  end
end
