class AuthenticationController < ApplicationController
	skip_before_action :authenticate
	def login
		@user = User.find_by(username: params[:username])
		if @user
			if(@user.authenticate(params[:password]))
				payload = {user_id: @user.id}
				secret = ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base
				token = create_token(payload)
				render json: { username: @user.username, user_id: @user.id, token: token}
			else
				render json: {message: "authentication failed"}
			end

		else
			render json: {message: "could not find user"}
		end
	end
end
