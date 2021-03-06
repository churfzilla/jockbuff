class SessionsController < ApplicationController

  def new
    redirect_to '/auth/yahoo'
  end

  def create
    auth = request.env["omniauth.auth"]
    puts "\n\n\n\nAUTH: #{auth}\n\n\n"
    user = User.where(:provider => auth['provider'],
                      :image => auth['info']['urls']['image'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    # reset_session
    session[:user_id] = user.id
    redirect_to leagues_path, :notice => 'Signed in!'
  end

  # def destroy
  #   session[:user_id] = nil
  #   redirect_to '/'
  # end

  def destroy
  if current_user
    session.delete(:user_id)
    flash[:success] = 'See you!'
  end
  redirect_to root_path
end

end