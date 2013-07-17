class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			# Sign the user in and redirect to the user's show page
			sign_in user , params[:session][:set_cookie]
<<<<<<< HEAD
			redirect_back_or user
=======
			redirect_to user
>>>>>>> 7637ccc668a25b67ab2aefcdf53f8963e6ce64dc
		else
			flash.now[:error] = 'Invalid email/password combination' 
			# Not quite right!
			render 'new'
		end
	end
	def destroy
		sign_out
		redirect_to root_url
	end
end
