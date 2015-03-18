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
    end
  end
  
  # Returns true for a logged in user
  def logged_in?
    !current_user.nil?
  end
  
  # Logs out the current_user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
end
