module SessionsHelper
  def sign_in(user)
    user = User.find_by_id(user)
    cookies.permanent[:user_id] = user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def current_user?(user)
    user == current_user
  end
  
  def sign_out
    session[:user_id] = nil
    cookies.delete(:user_id)
  end

end  