module SessionsHelper
	def sign_in(user , set_cookie)
<<<<<<< HEAD
		# 1 for permanent cookie, 0 for temporary cookie, 2 for no change to the cookie(used when update)
=======
>>>>>>> 7637ccc668a25b67ab2aefcdf53f8963e6ce64dc
		if set_cookie.to_s == "1".to_s
		   cookies.permanent[:remember_token] = user.remember_token 
		else
		   cookies[:remember_token] = user.remember_token
		end
   		self.current_user = user			
	end
	def signed_in?
		!current_user.nil?
	end
	def current_user= (user)
		@current_user = user
	end
	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end
	def current_user?(user)
		user == current_user
	end
	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end
	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end
	def store_location
		session[:return_to] = request.url
	end
end
