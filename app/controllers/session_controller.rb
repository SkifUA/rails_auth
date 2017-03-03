class SessionController < ApplicationController

  def new
  end

  # action for login user and set in session user_id
  def create
    @user = User.find_by_email(params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to 'login'
    end
  end

  # action logout user delete auth user_id and redirect to root
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
