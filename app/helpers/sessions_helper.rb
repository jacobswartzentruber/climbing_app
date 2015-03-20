module SessionsHelper
  
  # Logs in the user
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Returns true if the user is current_user
  def current_user?(user)
    user == current_user
  end
  
  # Returns the current logged-in user if any
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user 
        @current_user = user
      end
    end
  end
  
  # Returns true for a logged in user
  def logged_in?
    !current_user.nil?
  end
  
  # Logs out the current_user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  # Remembers the user
  def remember(user)
    #Create remember token and remember_digest for the user
    user.remember
    #Create the permanent cookies
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  # Forgets the user
  def forget(user)
    # Sets remember_digest to nil
    user.forget
    # Delete the permanent cookies
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end
