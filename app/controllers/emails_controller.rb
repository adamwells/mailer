class EmailsController < ApplicationController
	skip_before_filter  :verify_authenticity_token

	def create
		@email = Email.new(email_params)
		if @email.save
			render json: @email
			Emailer.send_out(@email).deliver
		else
			render json: @email.errors.full_messages
		end
	end

	private

	def email_params
		params.permit(:to, :body, :subject)
	end
end
