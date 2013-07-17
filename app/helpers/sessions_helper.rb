module SessionsHelper
	def sign_in(user , set_cookie)
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
	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end
end
